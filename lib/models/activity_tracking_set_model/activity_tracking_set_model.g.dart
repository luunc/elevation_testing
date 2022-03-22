// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_tracking_set_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityTrackingSetModel _$ActivityTrackingSetModelFromJson(
        Map<String, dynamic> json) =>
    ActivityTrackingSetModel(
      startTime: json['startTime'] as int?,
      endTime: json['endTime'] as int?,
      trackCount: json['trackCount'] as int?,
      maxElevation: (json['maxElevation'] as num?)?.toDouble(),
      ascend: (json['ascend'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ActivityTrackingSetModelToJson(
        ActivityTrackingSetModel instance) =>
    <String, dynamic>{
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'trackCount': instance.trackCount,
      'maxElevation': instance.maxElevation,
      'ascend': instance.ascend,
    };
