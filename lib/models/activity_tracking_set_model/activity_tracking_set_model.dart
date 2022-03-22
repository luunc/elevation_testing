import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'activity_tracking_set_model.g.dart';

@JsonSerializable()
class ActivityTrackingSetModel {
  final int? startTime;
  final int? endTime;
  final int? trackCount;
  final double? maxElevation;
  final double? ascend;

  ActivityTrackingSetModel({
    required this.startTime,
    required this.endTime,
    required this.trackCount,
    required this.maxElevation,
    required this.ascend,
  });

  factory ActivityTrackingSetModel.fromRawJson(String str) =>
      ActivityTrackingSetModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ActivityTrackingSetModel.fromJson(Map<String, dynamic> json) =>
      _$ActivityTrackingSetModelFromJson(json);

  Map<String, dynamic> toJson() => _$ActivityTrackingSetModelToJson(this);
}
