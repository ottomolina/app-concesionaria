import 'dart:convert';

import 'package:app_concesionario/src/models/clienteModel.dart';
import 'package:app_concesionario/src/models/vehiculoModel.dart';

ClienteCotizacion clienteCotizacionFromJson(String str) =>
    ClienteCotizacion.fromJson(json.decode(str));

String clienteCotizacionToJson(ClienteCotizacion data) =>
    json.encode(data.toJson());

class ClienteCotizacion {
  ClienteCotizacion({
    this.total,
    this.lista,
  });

  int total;
  List<Cliente> lista;

  factory ClienteCotizacion.fromJson(Map<String, dynamic> json) =>
      ClienteCotizacion(
        total: json["total"],
        lista:
            List<Cliente>.from(json["lista"].map((x) => Cliente.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "lista": List<dynamic>.from(lista.map((x) => x.toJson())),
      };
}

CotizacionModel cotizacionModelFromJson(String str) =>
    CotizacionModel.fromJson(json.decode(str));

String cotizacionModelToJson(CotizacionModel data) =>
    json.encode(data.toJson());

class CotizacionModel {
  CotizacionModel({
    this.total,
    this.lista,
  });

  int total;
  List<Cotizacion> lista;

  factory CotizacionModel.fromJson(Map<String, dynamic> json) =>
      CotizacionModel(
        total: json["total"],
        lista: List<Cotizacion>.from(
            json["lista"].map((x) => Cotizacion.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "lista": List<dynamic>.from(lista.map((x) => x.toJson())),
      };
}

Cotizacion cotizacionFromJson(String str) =>
    Cotizacion.fromJson(json.decode(str));

String cotizacionToJson(Cotizacion data) => json.encode(data.toJson());

class Cotizacion {
  Cotizacion({
    this.agenteid,
    this.concesionarioid,
    this.cliente,
    this.vehiculo,
    this.creado,
    this.id,
  });

  String agenteid;
  String concesionarioid;
  Cliente cliente;
  Vehiculo vehiculo;
  DateTime creado;
  String id;

  factory Cotizacion.fromJson(Map<String, dynamic> json) => Cotizacion(
        agenteid: json["agenteid"],
        concesionarioid: json["concesionarioid"],
        cliente: Cliente.fromJson(json["cliente"]),
        vehiculo: Vehiculo.fromJson(json["vehiculo"]),
        creado: DateTime.parse(json["creado"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "agenteid": agenteid,
        "concesionarioid": concesionarioid,
        "cliente": cliente.toJson(),
        "vehiculo": vehiculo.toJson(),
        "creado": creado.toIso8601String(),
        "id": id,
      };
}
