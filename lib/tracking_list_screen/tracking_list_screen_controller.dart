import 'package:check_location/tracking_data_box/tracking_data_box.dart';
import 'package:get/get.dart';

import 'package:check_location/models/activity_tracking_set_model/activity_tracking_set_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TrackingListScreenController extends GetxController {
  static TrackingListScreenController get to => Get.find();

  final data = <ActivityTrackingSetModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  Future<void> getData() async {
    try {
      final dataBox = await Hive.openBox(TrackingDataBox.boxName);

      final jsonList = dataBox.values;

      final activities =
          jsonList.map((j) => ActivityTrackingSetModel.fromRawJson(j));

      data.assignAll(activities);
    } catch (e) {
      print(e);
    }
  }
}
