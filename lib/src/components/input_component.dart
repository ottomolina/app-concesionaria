import 'package:app_concesionario/src/util/util.dart' as utils;
import 'package:flutter/material.dart';

class InputComponent {
  Widget crearInputText(String label, [String mensaje]) {
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(labelText: label),
      validator: (value) {
        if (value.length == 0) {
          return mensaje ?? 'Ingrese un valor';
        } else {
          return null;
        }
      },
    );
  }

  Widget crearInputPhone(String label, [String mensaje]) {
    return TextFormField(
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(labelText: label),
      validator: (value) {
        if (value.length == 0) {
          return mensaje ?? 'Ingrese un valor';
        } else {
          return null;
        }
      },
    );
  }

  Widget crearInputNumber(String label, [String mensaje]) {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: label),
      validator: (value) {
        if (utils.isNumeric(value)) {
          return null;
        } else {
          return mensaje ?? 'Sólo números';
        }
      },
    );
  }

  Widget crearInputDate(String label) {
    return TextFormField(
      keyboardType: TextInputType.datetime,
      decoration: InputDecoration(labelText: label),
    );
  }
}
