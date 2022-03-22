import 'dart:math' as math;

import 'dart:async';

import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:location/location.dart';
import 'package:dio/dio.dart';

import 'package:check_location/config.dart';
import 'package:check_location/tracking_data_box/tracking_data_box.dart';
import 'package:check_location/models/app_location_data_model/app_location_data_model.dart';
import 'package:check_location/models/activity_tracking_set_model/activity_tracking_set_model.dart';
import 'package:check_location/models/gg_elevation_response_model/gg_elevation_response_model.dart';

enum TrackingStatus {
  tracking,
  paused,
  stop,
}

class HomeTrackingController extends GetxController {
  static HomeTrackingController get to => Get.find();

  final dio = Dio();
  final locationPlugin = Location();
  final elevationData = <AppElevationDataModel>[].obs;
  final maxElevation = double.negativeInfinity.obs;
  final ascend = 0.0.obs;
  final trackingStatus = TrackingStatus.stop.obs;

  List<LocationData> tenLocations = [];
  StreamSubscription<LocationData>? locationStream;

  // void analysisDataOnChange(LocationData currentLocation) {
  //   final newAltitude = currentLocation.altitude ?? 0.0;
  //   if (newAltitude > maxElevation.value) maxElevation.value = newAltitude;
  //
  //   if (locations.isNotEmpty) {
  //     final previousAltitude = locations.first.altitude ?? 0.0;
  //     final diff = newAltitude - previousAltitude;
  //     if (diff > 0 && diff < 10) {
  //       ascend.value = ascend.value + diff;
  //     }
  //   }
  //
  //   locations.insert(0, currentLocation);
  // }

  void addDataToTracking(LocationData currentLocation) {
    tenLocations.insert(0, currentLocation);
    if (tenLocations.length < 5) return;
    fetchElevationData([...tenLocations]);
    tenLocations = [];
  }

  Future<void> startTracking() async {
    bool serviceEnabled = await locationPlugin.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await locationPlugin.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    PermissionStatus permissionGranted;

    permissionGranted = await locationPlugin.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await locationPlugin.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    locationPlugin.changeSettings(
      accuracy: LocationAccuracy.high,
      interval: 1000,
      distanceFilter: 0,
    );
    locationPlugin.enableBackgroundMode(enable: true);
    locationStream = locationPlugin.onLocationChanged.listen(addDataToTracking);
    trackingStatus.value = TrackingStatus.tracking;
  }

  void resumeTracking() {
    trackingStatus.value = TrackingStatus.tracking;
    locationPlugin.enableBackgroundMode(enable: true);
    locationStream?.resume();
  }

  void pauseTracking() {
    trackingStatus.value = TrackingStatus.paused;
    locationPlugin.enableBackgroundMode(enable: false);
    locationStream?.pause();
  }

  Future<void> stopTracking() async {
    try {
      trackingStatus.value = TrackingStatus.stop;
      locationPlugin.enableBackgroundMode(enable: false);
      locationStream?.cancel();

      final activity = ActivityTrackingSetModel(
        ascend: ascend.value,
        maxElevation: maxElevation.value,
        trackCount: elevationData.length,
        endTime: elevationData.first.time?.toInt() ?? 0,
        startTime: elevationData.last.time?.toInt() ?? 0,
      );

      final dataBox = await Hive.openBox(TrackingDataBox.boxName);
      dataBox.add(activity.toRawJson());

      maxElevation.value = double.negativeInfinity;
      ascend.value = 0.0;
      elevationData.assignAll([]);
      // dataBox.clear();
    } catch (e) {
      print(e);
    }
  }

  Future<void> fetchElevationData(List<LocationData> newLocations) async {
    final locationParam = newLocations
        .map<String>((l) => "${l.latitude},${l.longitude}")
        .toList()
        .join("|");

    try {
      final rawResponse = await dio.get(
        ggElevationEndPoint,
        queryParameters: {
          "key": ggApiKey,
          "locations": locationParam,
        },
      );

      final response = GGElevationResponseModel.fromJson(rawResponse.data);
      if (response.status?.toLowerCase() != "ok") return;

      final ggElevationData = response.elevations ?? [];
      final newElevations = [];
      double newAscend = 0.0;
      double localMaxElevation = double.negativeInfinity;

      for (int i = 0; i < ggElevationData.length; i++) {
        final l = ggElevationData[i];
        final currentElevation = l.elevation ?? double.negativeInfinity;
        localMaxElevation = math.max(currentElevation, localMaxElevation);

        if (i > 0) {
          final previousL = ggElevationData[i - 1];
          final previousElevation =
              previousL.elevation ?? double.negativeInfinity;

          if (currentElevation > previousElevation) {
            newAscend += currentElevation - previousElevation;
          }
        }

        newElevations.add(
          AppElevationDataModel(
            time: newLocations[i].time?.toInt(),
            altitude: currentElevation,
          ),
        );
      }

      elevationData.assignAll([...newElevations, ...elevationData]);
      maxElevation.value = math.max(localMaxElevation, maxElevation.value);
      ascend.value += newAscend;
    } catch (e) {
      Get.snackbar("Error", e.toString());
      print("e $e");
    }
  }
}
