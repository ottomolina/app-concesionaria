import 'package:flutter/material.dart';

import 'package:app_concesionario/src/components/detalleCotizacionComponent.dart';
import 'package:app_concesionario/src/models/concesionarioModel.dart';
import 'package:app_concesionario/src/models/cotizacionModel.dart';
import 'package:app_concesionario/src/models/loginModel.dart';
import 'package:app_concesionario/src/providers/usuarioProvider.dart';
import 'package:app_concesionario/src/util/storage.dart';

class DetalleCotizacionPage extends StatelessWidget {
  static final pageName = 'detalle-cotizacion';
  DetalleCotizacionPage({Key key}) : super(key: key);
  final _store = new Storage();
  final _usuarioProv = new UsuarioProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Detalle de cotización')),
      body: Container(
          padding: EdgeInsets.all(10), child: _cargarDetalle(context)),
    );
  }

  Widget _cargarDetalle(BuildContext context) {
    final cotizacion = ModalRoute.of(context).settings.arguments as Cotizacion;
    final concesionario = concesionarioFromJson(_store.concesionario);
    final usuario = usuarioModelFromJson(_store.usuario);
    return FutureBuilder(
      future: _usuarioProv.getUsuarios(usuario.uid),
      builder: (BuildContext context, AsyncSnapshot<UsuarioModel> snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        } else {
          return DetalleCotizacionComponent().getDetalleCotizacion(
              concesionario, usuario, cotizacion.cliente, cotizacion.vehiculo);
        }
      },
    );
  }
}
