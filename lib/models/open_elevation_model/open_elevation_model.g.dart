// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'open_elevation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OpenElevationModel _$OpenElevationModelFromJson(Map<String, dynamic> json) =>
    OpenElevationModel(
      (json['longitude'] as num?)?.toDouble(),
      (json['elevation'] as num?)?.toDouble(),
      (json['latitude'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$OpenElevationModelToJson(OpenElevationModel instance) =>
    <String, dynamic>{
      'longitude': instance.longitude,
      'elevation': instance.elevation,
      'latitude': instance.latitude,
    };
