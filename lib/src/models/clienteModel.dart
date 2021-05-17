// To parse this JSON data, do
//
//     final cliente = clienteFromJson(jsonString);

import 'dart:convert';

ClienteLista clienteListaFromJson(String str) =>
    ClienteLista.fromJson(json.decode(str));

String clienteListaToJson(ClienteLista data) => json.encode(data.toJson());

class ClienteLista {
  ClienteLista({
    this.total,
    this.lista,
  });

  int total;
  List<Cliente> lista;

  factory ClienteLista.fromJson(Map<String, dynamic> json) => ClienteLista(
        total: json["total"],
        lista:
            List<Cliente>.from(json["lista"].map((x) => Cliente.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "lista": List<dynamic>.from(lista.map((x) => x.toJson())),
      };
}

Cliente clienteFromJson(String str) => Cliente.fromJson(json.decode(str));

String clienteToJson(Cliente data) => json.encode(data.toJson());

class Cliente {
  String nombres;
  String apellidos;
  String telefono;
  String correo;
  String direccion;
  DateTime nacimiento;
  String genero;
  String ocupacion;
  double ingresos;
  String id;
  bool isExpanded = false;

  Cliente({
    this.nombres,
    this.apellidos,
    this.telefono,
    this.correo,
    this.direccion,
    this.nacimiento,
    this.genero,
    this.ocupacion,
    this.ingresos,
    this.id,
  });

  factory Cliente.fromJson(Map<String, dynamic> json) => Cliente(
        nombres: json["nombres"],
        apellidos: json["apellidos"],
        telefono: json["telefono"],
        correo: json["correo"],
        direccion: json["direccion"],
        nacimiento: DateTime.parse(json["nacimiento"]),
        genero: json["genero"],
        ocupacion: json["ocupacion"],
        ingresos: json["ingresos"].toDouble(),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "nombres": nombres,
        "apellidos": apellidos,
        "telefono": telefono,
        "correo": correo,
        "direccion": direccion,
        "nacimiento": nacimiento.toIso8601String(),
        "genero": genero,
        "ocupacion": ocupacion,
        "ingresos": ingresos,
        "id": id,
      };
}
