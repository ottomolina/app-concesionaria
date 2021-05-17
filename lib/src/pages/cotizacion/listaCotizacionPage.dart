import 'package:app_concesionario/src/components/vehiculoComponent.dart';
import 'package:app_concesionario/src/models/cotizacionModel.dart';
import 'package:app_concesionario/src/models/vehiculoModel.dart';
import 'package:app_concesionario/src/providers/cotizacionProvider.dart';
import 'package:flutter/material.dart';
import 'package:app_concesionario/src/models/clienteModel.dart';

class ListaCotizacionPage extends StatefulWidget {
  static final pageName = 'lista-cotizacion';
  ListaCotizacionPage({Key key}) : super(key: key);

  @override
  _ListaCotizacionPageState createState() => _ListaCotizacionPageState();
}

class _ListaCotizacionPageState extends State<ListaCotizacionPage> {
  final _cotizacionProv = new CotizacionProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Cotizaciones del cliente'),
        ),
        body: _cargarCotizaciones());
  }

  Widget _cargarCotizaciones() {
    final cliente = ModalRoute.of(context).settings.arguments as Cliente;
    return FutureBuilder(
      future: _cotizacionProv.getListadoCotizacion(cliente.id),
      builder:
          (BuildContext context, AsyncSnapshot<List<Cotizacion>> snapshot) {
        if (snapshot.hasData) {
          final lista = snapshot.data;
          return Container(
              padding: EdgeInsets.all(10),
              child: ListView.builder(
                  itemCount: lista.length,
                  itemBuilder: (BuildContext context, int index) {
                    Vehiculo vehiculo = lista[index].vehiculo;
                    return VehiculoComponent().listadoVehiculos(context,
                        vehiculo, 'detalle-cotizacion', () {}, lista[index]);
                  }));
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
