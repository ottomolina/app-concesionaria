import 'package:flutter/material.dart';
import 'package:app_concesionario/src/models/loginModel.dart';
import 'package:app_concesionario/src/util/loadingOverlay.dart';
import 'package:app_concesionario/src/util/storage.dart';
import 'package:app_concesionario/src/util/util.dart';

class HomePage extends StatefulWidget {
  static final pageName = 'home';
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _store = new Storage();
  UsuarioModel _usuario = new UsuarioModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: Text('Concesionario'),
        ),
        body: _getImage(),
        drawer: _getDrawer());
  }

  Widget _getImage() {
    return Center(child: Image.asset('assets/home-background.png'));
  }

  Widget _getDrawer() {
    return Drawer(
        elevation: 20.0,
        child: FutureBuilder(
          future: _store.localStorage.ready,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              _usuario = usuarioModelFromJson(_store.usuario);

              return Drawer(
                  elevation: 20.0,
                  child: Column(children: <Widget>[
                    _getUserDrawerAccount(),
                    _getMenuitem('Clientes', new Icon(Icons.account_circle),
                        () {
                      Navigator.pushNamed(context, 'clientes');
                    }),
                    _getMenuitem('Vehículos', new Icon(Icons.directions_car),
                        () {
                      Navigator.pushNamed(context, 'vehiculos');
                    }),
                    _getMenuitem('Cotizaciones', new Icon(Icons.list_alt), () {
                      Navigator.pushNamed(context, 'cotizacion');
                    }),
                    _getMenuitem(
                        'Salir',
                        new Icon(Icons.exit_to_app),
                        () => confirmDialog(
                            context, '¿Deseas salir?', () => {_salir()})),
                  ]));
            }
          },
        ));
  }

  void _salir() {
    new Future(() async {
      final overlay = LoadingOverlay.of(context);
      await overlay.during(new Future(() async {
        await _store.cierraSesion();
      }));
    }).then((value) =>
        Navigator.pushNamedAndRemoveUntil(context, 'login', (route) => false));
  }

  Widget _getUserDrawerAccount() {
    return UserAccountsDrawerHeader(
      accountName: Text('${_usuario.nombres} ${_usuario.apellidos}'),
      accountEmail: Text(_usuario.correo),
      currentAccountPicture: CircleAvatar(
          backgroundColor: Colors.blue.shade800, child: Text(_getIniciales())),
    );
  }

  String _getIniciales() {
    String firstLetterNombre = _usuario.nombres.substring(0, 1);
    String firstLetterApellido = _usuario.apellidos.substring(0, 1);
    return '$firstLetterNombre$firstLetterApellido';
  }

  Widget _getMenuitem(String texto, Icon icono, Function onTapItem) {
    return ListTile(
      title: new Text(texto),
      leading: icono,
      onTap: onTapItem,
    );
  }
}
