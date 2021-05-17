// To parse this JSON data, do
//
//     final errorModel = errorModelFromJson(jsonString);

import 'dart:convert';

ErrorModel errorModelFromJson(String str) =>
    ErrorModel.fromJson(json.decode(str));

String errorModelToJson(ErrorModel data) => json.encode(data.toJson());

class ErrorModel {
  ErrorModel({
    this.errors,
  });

  List<Error> errors;

  factory ErrorModel.fromJson(Map<String, dynamic> json) => ErrorModel(
        errors: List<Error>.from(json["errors"].map((x) => Error.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "errors": List<dynamic>.from(errors.map((x) => x.toJson())),
      };
}

class Error {
  Error({
    this.msg,
    this.param,
    this.location,
  });

  String msg;
  String param;
  String location;

  factory Error.fromJson(Map<String, dynamic> json) => Error(
        msg: json["msg"],
        param: json["param"],
        location: json["location"],
      );

  Map<String, dynamic> toJson() => {
        "msg": msg,
        "param": param,
        "location": location,
      };
}
