import 'package:flutter/material.dart';
import 'package:app_concesionario/src/components/clienteComponent.dart';
import 'package:app_concesionario/src/components/detalleCotizacionComponent.dart';
import 'package:app_concesionario/src/components/vehiculoComponent.dart';
import 'package:app_concesionario/src/models/clienteModel.dart';
import 'package:app_concesionario/src/models/concesionarioModel.dart';
import 'package:app_concesionario/src/models/cotizacionModel.dart';
import 'package:app_concesionario/src/models/loginModel.dart';
import 'package:app_concesionario/src/models/vehiculoModel.dart';
import 'package:app_concesionario/src/providers/clienteProvider.dart';
import 'package:app_concesionario/src/providers/cotizacionProvider.dart';
import 'package:app_concesionario/src/providers/vehiculoProvider.dart';
import 'package:app_concesionario/src/util/loadingOverlay.dart';
import 'package:app_concesionario/src/util/storage.dart';
import 'package:app_concesionario/src/util/util.dart';

class NewCotizacionPage extends StatefulWidget {
  static final String pageName = 'new-cotizacion';
  NewCotizacionPage({Key key}) : super(key: key);

  @override
  _NewCotizacionPageState createState() => _NewCotizacionPageState();
}

class _NewCotizacionPageState extends State<NewCotizacionPage> {
  final _clienteProv = new ClienteProvider();
  final _vehiculoProv = new VehiculoProvider();
  final _cotizacionProv = new CotizacionProvider();
  final _store = new Storage();
  TabController _tabController;
  int _indexTab;
  Cliente _cliente;
  Vehiculo _vehiculo;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 0,
        length: 3,
        child: Builder(builder: (BuildContext context) {
          _tabController = DefaultTabController.of(context);
          _tabController.addListener(() {
            if (!_tabController.indexIsChanging) {
              setState(() {
                _indexTab = _tabController.index;
              });
            }
          });
          return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: const Text('Nueva cotización'),
                bottom: const TabBar(
                  tabs: <Widget>[
                    Tab(
                      text: 'Clientes',
                      icon: Icon(Icons.account_circle),
                    ),
                    Tab(
                      text: 'Vehículos',
                      icon: Icon(Icons.directions_car),
                    ),
                    Tab(
                      text: 'Confirma',
                      icon: Icon(Icons.check),
                    ),
                  ],
                ),
              ),
              body: TabBarView(
                children: <Widget>[
                  ClienteComponent().cargarClientes(
                      _clienteProv.listaCliente(), null, _selectCliente),
                  VehiculoComponent().cargarVehiculos(
                      _vehiculoProv.listaVehiculos(), null, _selectVehiculo),
                  _presentConfirmView(context)
                ],
              ),
              floatingActionButton: _showActionButton());
        }));
  }

  void _selectCliente(item) {
    setState(() {
      _cliente = item;
    });
    _tabController.animateTo((_tabController.index + 1));
  }

  void _selectVehiculo(item) {
    setState(() {
      _vehiculo = item;
    });
    _tabController.animateTo((_tabController.index + 1));
  }

  Widget _presentConfirmView(BuildContext context) {
    if (_indexTab != 2) {
      return Center();
    }
    if (_cliente == null) {
      return Center(
        child: Text('Aún no ha seleccionado el cliente'),
      );
    }
    if (_vehiculo == null) {
      return Center(
        child: Text('Aún no ha seleccionado el vehículo'),
      );
    }
    return _createConfirmView();
  }

  Widget _createConfirmView() {
    final concesionario = concesionarioFromJson(_store.concesionario);
    final usuario = usuarioModelFromJson(_store.usuario);
    return Container(
        padding: EdgeInsets.all(10),
        child: DetalleCotizacionComponent()
            .getDetalleCotizacion(concesionario, usuario, _cliente, _vehiculo));
  }

  Widget _showActionButton() {
    return Visibility(
      child: FloatingActionButton(
        tooltip: 'Guarda la cotización',
        child: Icon(Icons.save),
        onPressed: () => {
          _crearCotizacion().then((value) {
            Navigator.pop(context);
          }, onError: (error) {
            mostrarMensaje(context, error);
          })
        },
      ),
      visible: _indexTab == 2,
    );
  }

  Future _crearCotizacion() async {
    final overlay = LoadingOverlay.of(context);
    final result = await overlay.during(new Future(() async {
      Cotizacion cotizacion = new Cotizacion();
      cotizacion.cliente = _cliente;
      cotizacion.vehiculo = _vehiculo;

      await _cotizacionProv.crearCotizacion(cotizacion);
      return true;
    }));
    return result;
  }
}
