// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'altitude_tracking_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AltitudeTrackingModel _$AltitudeTrackingModelFromJson(
        Map<String, dynamic> json) =>
    AltitudeTrackingModel(
      time: json['time'] as int?,
      altitude: (json['altitude'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$AltitudeTrackingModelToJson(
        AltitudeTrackingModel instance) =>
    <String, dynamic>{
      'time': instance.time,
      'altitude': instance.altitude,
    };
