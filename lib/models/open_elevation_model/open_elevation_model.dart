import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'open_elevation_model.g.dart';

@JsonSerializable()
class OpenElevationModel {
  final double? longitude;
  final double? elevation;
  final double? latitude;

  OpenElevationModel(this.longitude, this.elevation, this.latitude);

  factory OpenElevationModel.fromRawJson(String str) =>
      OpenElevationModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OpenElevationModel.fromJson(Map<String, dynamic> json) =>
      _$OpenElevationModelFromJson(json);

  Map<String, dynamic> toJson() => _$OpenElevationModelToJson(this);
}
