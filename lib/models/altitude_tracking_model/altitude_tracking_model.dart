import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'altitude_tracking_model.g.dart';

@JsonSerializable()
class AltitudeTrackingModel {
  final int? time;
  final double? altitude;

  AltitudeTrackingModel({
    required this.time,
    required this.altitude,
  });

  factory AltitudeTrackingModel.fromRawJson(String str) =>
      AltitudeTrackingModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AltitudeTrackingModel.fromJson(Map<String, dynamic> json) =>
      _$AltitudeTrackingModelFromJson(json);

  Map<String, dynamic> toJson() => _$AltitudeTrackingModelToJson(this);
}
