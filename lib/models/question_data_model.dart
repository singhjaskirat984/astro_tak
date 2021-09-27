//     final questionsDataModel = questionsDataModelFromJson(jsonString);
import 'dart:convert';

QuestionsDataModel questionsDataModelFromJson(String str) =>
    QuestionsDataModel.fromJson(json.decode(str));

String questionsDataModelToJson(QuestionsDataModel data) =>
    json.encode(data.toJson());

class QuestionsDataModel {
  QuestionsDataModel({
    this.questionsData,
  });

  List<QuestionsDatum>? questionsData;

  factory QuestionsDataModel.fromJson(Map<String, dynamic> json) =>
      QuestionsDataModel(
        questionsData: json["questionsData"] == null
            ? null
            : List<QuestionsDatum>.from(
                json["questionsData"].map((x) => QuestionsDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "questionsData": questionsData == null
            ? null
            : List<dynamic>.from(questionsData!.map((x) => x.toJson())),
      };
}

class QuestionsDatum {
  QuestionsDatum({
    this.id,
    this.httpStatus,
    this.success,
    this.message,
    this.apiName,
    this.data,
    this.v,
  });

  String? id;
  String? httpStatus;
  bool? success;
  String? message;
  String? apiName;
  List<Datum>? data;
  int? v;

  factory QuestionsDatum.fromJson(Map<String, dynamic> json) => QuestionsDatum(
        id: json["_id"] == null ? null : json["_id"],
        httpStatus: json["httpStatus"] == null ? null : json["httpStatus"],
        success: json["success"] == null ? null : json["success"],
        message: json["message"] == null ? null : json["message"],
        apiName: json["apiName"] == null ? null : json["apiName"],
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        v: json["__v"] == null ? null : json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "httpStatus": httpStatus == null ? null : httpStatus,
        "success": success == null ? null : success,
        "message": message == null ? null : message,
        "apiName": apiName == null ? null : apiName,
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "__v": v == null ? null : v,
      };
}

class Datum {
  Datum({
    this.datumId,
    this.name,
    this.description,
    this.price,
    this.suggestions,
    this.id,
  });

  int? datumId;
  String? name;
  String? description;
  int? price;
  List<String>? suggestions;
  String? id;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        datumId: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        description: json["description"] == null ? null : json["description"],
        price: json["price"] == null ? null : json["price"],
        suggestions: json["suggestions"] == null
            ? null
            : List<String>.from(json["suggestions"].map((x) => x)),
        id: json["_id"] == null ? null : json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": datumId == null ? null : datumId,
        "name": name == null ? null : name,
        "description": description == null ? null : description,
        "price": price == null ? null : price,
        "suggestions": suggestions == null
            ? null
            : List<dynamic>.from(suggestions!.map((x) => x)),
        "_id": id == null ? null : id,
      };
}
