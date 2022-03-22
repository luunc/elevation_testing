// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gg_elevation_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GGElevationResponseModel _$GGElevationResponseModelFromJson(
        Map<String, dynamic> json) =>
    GGElevationResponseModel(
      elevations: (json['results'] as List<dynamic>?)
          ?.map((e) => GGElevationModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String?,
    );

Map<String, dynamic> _$GGElevationResponseModelToJson(
        GGElevationResponseModel instance) =>
    <String, dynamic>{
      'results': instance.elevations,
      'status': instance.status,
    };

GGElevationModel _$GGElevationModelFromJson(Map<String, dynamic> json) =>
    GGElevationModel(
      elevation: (json['elevation'] as num?)?.toDouble(),
      location: json['location'] == null
          ? null
          : GGLocationModel.fromJson(json['location'] as Map<String, dynamic>),
      resolution: (json['resolution'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$GGElevationModelToJson(GGElevationModel instance) =>
    <String, dynamic>{
      'elevation': instance.elevation,
      'location': instance.location,
      'resolution': instance.resolution,
    };

GGLocationModel _$GGLocationModelFromJson(Map<String, dynamic> json) =>
    GGLocationModel(
      lat: (json['lat'] as num?)?.toDouble(),
      lng: (json['lng'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$GGLocationModelToJson(GGLocationModel instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };
