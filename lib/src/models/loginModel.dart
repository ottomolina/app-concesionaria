// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.usuario,
    this.token,
  });

  UsuarioModel usuario;
  String token;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        usuario: UsuarioModel.fromJson(json["usuario"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "usuario": usuario.toJson(),
        "token": token,
      };
}

UsuarioModel usuarioModelFromJson(String str) =>
    UsuarioModel.fromJson(json.decode(str));

String usuarioModelToJson(UsuarioModel data) => json.encode(data.toJson());

class UsuarioModel {
  UsuarioModel({
    this.concesionarioid,
    this.estado,
    this.img,
    this.nombres,
    this.apellidos,
    this.correo,
    this.password,
    this.uid,
  });

  String concesionarioid;
  bool estado;
  String img;
  String nombres;
  String apellidos;
  String correo;
  String password;
  String uid;

  factory UsuarioModel.fromJson(Map<String, dynamic> json) => UsuarioModel(
        concesionarioid: json["concesionarioid"],
        estado: json["estado"],
        img: json["img"],
        nombres: json["nombres"],
        apellidos: json["apellidos"],
        correo: json["correo"],
        password: json["password"],
        uid: json["uid"],
      );

  Map<String, dynamic> toJson() => {
        "concesionarioid": concesionarioid,
        "estado": estado,
        "img": img,
        "nombres": nombres,
        "apellidos": apellidos,
        "correo": correo,
        "password": password,
        "uid": uid,
      };
}
