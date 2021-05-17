// import 'dart:async';

import 'package:app_concesionario/src/components/clienteComponent.dart';
import 'package:app_concesionario/src/providers/clienteProvider.dart';
import 'package:flutter/material.dart';

class ClientePage extends StatefulWidget {
  static final pageName = 'clientes';
  ClientePage({Key key}) : super(key: key);

  @override
  _ClientePageState createState() => _ClientePageState();
}

class _ClientePageState extends State<ClientePage> {
  final _clienteProv = new ClienteProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Clientes'),
      ),
      body: ClienteComponent()
          .cargarClientes(_clienteProv.listaCliente(), null, (cliente) {}),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () =>
      //       {Navigator.pushNamed(context, 'formCliente').then(_onGoBack)},
      //   tooltip: 'Agregar un cliente',
      //   child: Icon(Icons.add),
      // ),
    );
  }

  // FutureOr _onGoBack(dynamic value) {
  //   setState(() {});
  // }
}
