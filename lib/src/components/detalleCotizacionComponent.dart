import 'package:app_concesionario/src/components/cardComponent.dart';
import 'package:app_concesionario/src/models/clienteModel.dart';
import 'package:app_concesionario/src/models/concesionarioModel.dart';
import 'package:app_concesionario/src/models/loginModel.dart';
import 'package:app_concesionario/src/models/vehiculoModel.dart';
import 'package:flutter/material.dart';

class DetalleCotizacionComponent {
  Widget getDetalleCotizacion(Concesionario concesionario, UsuarioModel usuario,
      Cliente cliente, Vehiculo vehiculo) {
    return Column(
      children: <Widget>[
        CardComponent().buildCard('Concesionario', Icon(Icons.store),
            concesionario.nombre, concesionario.direccion),
        Divider(
          height: 0,
          color: Colors.white,
        ),
        CardComponent().buildCard('Usuario', Icon(Icons.verified_user),
            '${usuario.nombres} ${usuario.apellidos}', usuario.correo),
        Divider(
          height: 0,
          color: Colors.white,
        ),
        CardComponent().buildCard('Cliente', Icon(Icons.account_circle),
            '${cliente.nombres} ${cliente.apellidos}', cliente.correo),
        Divider(
          height: 0,
          color: Colors.white,
        ),
        CardComponent().buildCard(
            'Vehículo',
            Icon(Icons.directions_car),
            '${vehiculo.marca} ${vehiculo.linea} ${vehiculo.modelo}',
            '${vehiculo.tipo} cc: ${vehiculo.cc}',
            '${vehiculo.precio}')
      ],
    );
  }
}
