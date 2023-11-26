// To parse this JSON data, do
//
//     final apiReadersModel = apiReadersModelFromJson(jsonString);

import 'dart:convert';

ApiReadersModel apiReadersModelFromJson(String str) => ApiReadersModel.fromJson(json.decode(str));

String apiReadersModelToJson(ApiReadersModel data) => json.encode(data.toJson());

class ApiReadersModel {
  int? code;
  String? status;
  List<ApiReaderData>? data;

  ApiReadersModel({
    this.code,
    this.status,
    this.data,
  });

  factory ApiReadersModel.fromJson(Map<String, dynamic> json) => ApiReadersModel(
    code: json["code"],
    status: json["status"],
    data: json["data"] == null ? [] : List<ApiReaderData>.from(json["data"]!.map((x) => ApiReaderData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "status": status,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class ApiReaderData {
  String? identifier;
  String? name;
  String? englishName;

  ApiReaderData({
    this.identifier,
    this.name,
    this.englishName,
  });

  factory ApiReaderData.fromJson(Map<String, dynamic> json) => ApiReaderData(
    identifier: json["identifier"],
    name: json["name"],
    englishName: json["englishName"],
  );

  Map<String, dynamic> toJson() => {
    "identifier": identifier,
    "name": name,
    "englishName": englishName,
  };
}
