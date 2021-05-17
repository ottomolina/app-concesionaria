// To parse this JSON data, do
//
//     final response = responseFromJson(jsonString);

import 'dart:convert';

ResponseModel responseFromJson(String str) =>
    ResponseModel.fromJson(json.decode(str));

String responseToJson(ResponseModel data) => json.encode(data.toJson());

class ResponseModel {
  ResponseModel({
    this.codigo,
    this.mensaje,
    this.data,
  });

  int codigo;
  dynamic mensaje;
  dynamic data;

  factory ResponseModel.fromJson(Map<String, dynamic> json) => ResponseModel(
        codigo: json["codigo"],
        mensaje: json["mensaje"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "codigo": codigo,
        "mensaje": mensaje,
        "data": data,
      };
}
