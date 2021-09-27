// To parse this JSON data, do
//
//     final hororscopeDataModel = hororscopeDataModelFromJson(jsonString);

import 'dart:convert';

HororscopeDataModel hororscopeDataModelFromJson(String str) => HororscopeDataModel.fromJson(json.decode(str));

String hororscopeDataModelToJson(HororscopeDataModel data) => json.encode(data.toJson());

class HororscopeDataModel {
  HororscopeDataModel({
    required this.hororscopeData,
  });

  List<HororscopeDatum> hororscopeData;

  factory HororscopeDataModel.fromJson(Map<String, dynamic> json) => HororscopeDataModel(
    hororscopeData: List<HororscopeDatum>.from(json["hororscopeData"].map((x) => HororscopeDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "hororscopeData": List<dynamic>.from(hororscopeData.map((x) => x.toJson())),
  };
}

class HororscopeDatum {
  HororscopeDatum({
    required this.id,
    required this.httpStatus,
    required this.success,
    required this.message,
    required this.apiName,
    required this.data,
    required this.v,
  });

  String id;
  String httpStatus;
  bool success;
  String message;
  String apiName;
  List<Datum> data;
  int v;

  factory HororscopeDatum.fromJson(Map<String, dynamic> json) => HororscopeDatum(
    id: json["_id"],
    httpStatus: json["httpStatus"],
    success: json["success"],
    message: json["message"],
    apiName: json["apiName"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "httpStatus": httpStatus,
    "success": success,
    "message": message,
    "apiName": apiName,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "__v": v,
  };
}

class Datum {
  Datum({
    required this.name,
    required this.date,
    required this.img,
    required this.images,
    required this.urlSlug,
    required this.id,
  });

  String name;
  String date;
  String img;
  List<Image> images;
  String urlSlug;
  String id;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    name: json["name"],
    date: json["date"],
    img: json["img"],
    images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
    urlSlug: json["urlSlug"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "date": date,
    "img": img,
    "images": List<dynamic>.from(images.map((x) => x.toJson())),
    "urlSlug": urlSlug,
    "_id": id,
  };
}

class Image {
  Image({
    required this.small,
    required this.large,
    required this.medium,
    required this.id,
  });

  Large small;
  Large large;
  Large medium;
  String id;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    small: Large.fromJson(json["small"]),
    large: Large.fromJson(json["large"]),
    medium: Large.fromJson(json["medium"]),
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "small": small.toJson(),
    "large": large.toJson(),
    "medium": medium.toJson(),
    "_id": id,
  };
}

class Large {
  Large({
    required this.imageUrl,
    required this.largeId,
    required this.id,
  });

  String imageUrl;
  String largeId;
  String id;

  factory Large.fromJson(Map<String, dynamic> json) => Large(
    imageUrl: json["imageUrl"] == null ? "null" : json["imageUrl"],
    largeId: json["id"] == null ? "null" : json["id"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "imageUrl": imageUrl == null ? null : imageUrl,
    "id": largeId == null ? null : largeId,
    "_id": id,
  };
}
