import 'package:flutter/material.dart';
import 'package:app_concesionario/src/components/vehiculoComponent.dart';
import 'package:app_concesionario/src/providers/vehiculoProvider.dart';

class VehiculoPage extends StatefulWidget {
  static final pageName = 'vehiculos';
  VehiculoPage({Key key}) : super(key: key);

  @override
  _VehiculoPageState createState() => _VehiculoPageState();
}

class _VehiculoPageState extends State<VehiculoPage> {
  final _vehiculoProv = new VehiculoProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Vehículos'),
        ),
        body: VehiculoComponent().cargarVehiculos(
            _vehiculoProv.listaVehiculos(), null, (vehiculo) {}));
  }
}
