// To parse this JSON data, do
//
//     final vehiculoModel = vehiculoModelFromJson(jsonString);

import 'dart:convert';

VehiculoLista vehiculoListaFromJson(String str) =>
    VehiculoLista.fromJson(json.decode(str));

String vehiculoListaToJson(VehiculoLista data) => json.encode(data.toJson());

class VehiculoLista {
  VehiculoLista({
    this.total,
    this.lista,
  });

  int total;
  List<Vehiculo> lista;

  factory VehiculoLista.fromJson(Map<String, dynamic> json) => VehiculoLista(
        total: json["total"],
        lista:
            List<Vehiculo>.from(json["lista"].map((x) => Vehiculo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "lista": List<dynamic>.from(lista.map((x) => x.toJson())),
      };
}

Vehiculo vehiculoModelFromJson(String str) =>
    Vehiculo.fromJson(json.decode(str));

String vehiculoModelToJson(Vehiculo data) => json.encode(data.toJson());

class Vehiculo {
  Vehiculo({
    this.tipo,
    this.marca,
    this.linea,
    this.cc,
    this.color,
    this.modelo,
    this.precio,
    this.id,
  });

  String tipo;
  String marca;
  String linea;
  int cc;
  String color;
  String modelo;
  double precio;
  String id;

  factory Vehiculo.fromJson(Map<String, dynamic> json) => Vehiculo(
        tipo: json["tipo"],
        marca: json["marca"],
        linea: json["linea"],
        cc: json["cc"],
        color: json["color"],
        modelo: json["modelo"],
        precio: json["precio"].toDouble(),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "tipo": tipo,
        "marca": marca,
        "linea": linea,
        "cc": cc,
        "color": color,
        "modelo": modelo,
        "precio": precio,
        "id": id,
      };
}
