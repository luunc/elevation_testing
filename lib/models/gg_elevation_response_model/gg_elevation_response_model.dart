import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'gg_elevation_response_model.g.dart';

@JsonSerializable()
class GGElevationResponseModel {
  @JsonKey(name: "results")
  final List<GGElevationModel>? elevations;
  final String? status;

  GGElevationResponseModel({this.elevations, this.status});

  factory GGElevationResponseModel.fromRawJson(String str) =>
      GGElevationResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GGElevationResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GGElevationResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$GGElevationResponseModelToJson(this);
}

////////////////////////////////////////////////////////////////////////////////

@JsonSerializable()
class GGElevationModel {
  final double? elevation;
  final GGLocationModel? location;
  final double? resolution;

  GGElevationModel({this.elevation, this.location, this.resolution});

  factory GGElevationModel.fromRawJson(String str) =>
      GGElevationModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GGElevationModel.fromJson(Map<String, dynamic> json) =>
      _$GGElevationModelFromJson(json);

  Map<String, dynamic> toJson() => _$GGElevationModelToJson(this);
}

////////////////////////////////////////////////////////////////////////////////

@JsonSerializable()
class GGLocationModel {
  final double? lat;
  final double? lng;

  GGLocationModel({this.lat, this.lng});

  factory GGLocationModel.fromRawJson(String str) =>
      GGLocationModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GGLocationModel.fromJson(Map<String, dynamic> json) =>
      _$GGLocationModelFromJson(json);

  Map<String, dynamic> toJson() => _$GGLocationModelToJson(this);
}
