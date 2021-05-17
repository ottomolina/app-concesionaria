// To parse this JSON data, do
//
//     final concesionarioModel = concesionarioModelFromJson(jsonString);

import 'dart:convert';

ConcesionarioModel concesionarioModelFromJson(String str) =>
    ConcesionarioModel.fromJson(json.decode(str));

String concesionarioModelToJson(ConcesionarioModel data) =>
    json.encode(data.toJson());

class ConcesionarioModel {
  ConcesionarioModel({
    this.total,
    this.lista,
  });

  int total;
  List<Concesionario> lista;

  factory ConcesionarioModel.fromJson(Map<String, dynamic> json) =>
      ConcesionarioModel(
        total: json["total"],
        lista: List<Concesionario>.from(
            json["lista"].map((x) => Concesionario.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "lista": List<dynamic>.from(lista.map((x) => x.toJson())),
      };
}

Concesionario concesionarioFromJson(String str) =>
    Concesionario.fromJson(json.decode(str));

String concesionarioToJson(Concesionario data) => json.encode(data.toJson());

class Concesionario {
  Concesionario({
    this.nombre,
    this.direccion,
    this.creado,
    this.id,
  });

  String nombre;
  String direccion;
  DateTime creado;
  String id;

  factory Concesionario.fromJson(Map<String, dynamic> json) => Concesionario(
        nombre: json["nombre"],
        direccion: json["direccion"],
        creado: DateTime.parse(json["creado"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "direccion": direccion,
        "creado": creado.toIso8601String(),
        "id": id,
      };
}
