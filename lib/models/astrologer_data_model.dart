// To parse this JSON data, do
//
//     final astrologerDataModel = astrologerDataModelFromJson(jsonString);

import 'dart:convert';

AstrologerDataModel astrologerDataModelFromJson(String str) => AstrologerDataModel.fromJson(json.decode(str));

String astrologerDataModelToJson(AstrologerDataModel data) => json.encode(data.toJson());

class AstrologerDataModel {
  AstrologerDataModel({
    required this.astrologerData,
  });

  List<AstrologerDatum>  astrologerData;

  factory AstrologerDataModel.fromJson(Map<String, dynamic> json) => AstrologerDataModel(
    astrologerData: List<AstrologerDatum>.from(json["AstrologerData"].map((x) => AstrologerDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "AstrologerData": List<dynamic>.from(astrologerData.map((x) => x.toJson())),
  };
}

class AstrologerDatum {
  AstrologerDatum({
    required this.id,
    required this.astrologerDatumId,
    required this.urlSlug,
    required this.namePrefix,
    required this.firstName,
    required this.lastName,
    required this.aboutMe,
    required this.profliePicUrl,
    required this.experience,
    required this.languages,
    required this.minimumCallDuration,
    required this.minimumCallDurationCharges,
    required this.additionalPerMinuteCharges,
    required this.isAvailable,
    required this.rating,
    required this.skills,
    required this.isOnCall,
    required this.images,
    required this.availability,
    required this.v,
  });

  String id;
  int astrologerDatumId;
  String urlSlug;
  String namePrefix;
  String firstName;
  String lastName;
  String aboutMe;
  String profliePicUrl;
  int experience;
  List<String> languages;
  int minimumCallDuration;
  int minimumCallDurationCharges;
  int additionalPerMinuteCharges;
  bool isAvailable;
  String rating;
  List<String> skills;
  bool isOnCall;
  List<Image> images;
  List<Availability> availability;
  int v;

  factory AstrologerDatum.fromJson(Map<String, dynamic> json) => AstrologerDatum(
    id: json["_id"],
    astrologerDatumId: json["id"],
    urlSlug: json["urlSlug"],
    namePrefix: json["namePrefix"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    aboutMe: json["aboutMe"],
    profliePicUrl: json["profliePicUrl"],
    experience: json["experience"],
    languages: List<String>.from(json["languages"].map((x) => x)),
    minimumCallDuration: json["minimumCallDuration"],
    minimumCallDurationCharges: json["minimumCallDurationCharges"],
    additionalPerMinuteCharges: json["additionalPerMinuteCharges"],
    isAvailable: json["isAvailable"],
    rating: json["rating"],
    skills: List<String>.from(json["skills"].map((x) => x)),
    isOnCall: json["isOnCall"],
    images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
    availability: List<Availability>.from(json["availability"].map((x) => Availability.fromJson(x))),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "id": astrologerDatumId,
    "urlSlug": urlSlug,
    "namePrefix": namePrefix,
    "firstName": firstName,
    "lastName": lastName,
    "aboutMe": aboutMe,
    "profliePicUrl": profliePicUrl,
    "experience": experience,
    "languages": List<dynamic>.from(languages.map((x) => x)),
    "minimumCallDuration": minimumCallDuration,
    "minimumCallDurationCharges": minimumCallDurationCharges,
    "additionalPerMinuteCharges": additionalPerMinuteCharges,
    "isAvailable": isAvailable,
    "rating": rating,
    "skills": List<dynamic>.from(skills.map((x) => x)),
    "isOnCall": isOnCall,
    "images": List<dynamic>.from(images.map((x) => x.toJson())),
    "availability": List<dynamic>.from(availability.map((x) => x.toJson())),
    "__v": v,
  };
}

class Availability {
  Availability({
    required this.days,
    required this.slot,
    required this.id,
  });

  List<String> days;
  Slot slot;
  String id;

  factory Availability.fromJson(Map<String, dynamic> json) => Availability(
    days: List<String>.from(json["days"].map((x) => x)),
    slot: Slot.fromJson(json["slot"]),
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "days": List<dynamic>.from(days.map((x) => x)),
    "slot": slot.toJson(),
    "_id": id,
  };
}

class Slot {
  Slot({
    required this.toFormat,
    required this.fromFormat,
    required this.from,
    required this.to,
    required this.id,
  });

  String toFormat;
  String fromFormat;
  String from;
  String to;
  String id;

  factory Slot.fromJson(Map<String, dynamic> json) => Slot(
    toFormat: json["toFormat"],
    fromFormat: json["fromFormat"],
    from: json["from"],
    to: json["to"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "toFormat": toFormat,
    "fromFormat": fromFormat,
    "from": from,
    "to": to,
    "_id": id,
  };
}

class Image {
  Image({
    required this.large,
    required this.medium,
    required this.id,
  });

  Large large;
  Large medium;
  String id;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    large: Large.fromJson(json["large"]),
    medium: Large.fromJson(json["medium"]),
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
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
    imageUrl: json["imageUrl"],
    largeId: json["id"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "imageUrl": imageUrl,
    "id": largeId,
    "_id": id,
  };
}
