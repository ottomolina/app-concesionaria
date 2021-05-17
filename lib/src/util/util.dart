import 'dart:convert';
import 'package:flutter/material.dart';

void mostrarMensaje(BuildContext context, String mensaje) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Información'),
          content: Text(mensaje),
          actions: <Widget>[
            TextButton(
                onPressed: () => Navigator.of(context).pop(), child: Text('Ok'))
          ],
        );
      });
}

void confirmDialog(BuildContext context, String mensaje, Function onYes) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Confirme'),
          content: Text(mensaje),
          actions: <Widget>[
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  onYes();
                },
                child: Text('Sí')),
            TextButton(
                onPressed: () => Navigator.of(context).pop(), child: Text('No'))
          ],
        );
      });
}

String toBase64(String str) {
  var bytes = utf8.encode(str);
  var base64 = base64Encode(bytes);
  return base64;
}

bool isNumeric(String s) {
  if (s.isEmpty) return false;

  final n = num.tryParse(s);
  return (n == null) ? false : true;
}
