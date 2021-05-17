import 'dart:async';

import 'package:app_concesionario/src/components/clienteComponent.dart';
import 'package:app_concesionario/src/providers/cotizacionProvider.dart';
import 'package:flutter/material.dart';

class CotizacionPage extends StatefulWidget {
  static final pageName = 'cotizacion';
  CotizacionPage({Key key}) : super(key: key);

  @override
  _CotizacionPageState createState() => _CotizacionPageState();
}

class _CotizacionPageState extends State<CotizacionPage> {
  final _cotizacionProv = new CotizacionProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Clientes con cotizaciones'),
      ),
      body: ClienteComponent().cargarClientes(
          _cotizacionProv.getClientesCotizacion(), 'lista-cotizacion'),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            {Navigator.pushNamed(context, 'new-cotizacion').then(_onGoBack)},
        tooltip: 'Agregar una cotización',
        child: Icon(Icons.add),
      ),
    );
  }

  FutureOr _onGoBack(dynamic value) {
    setState(() {});
  }
}
