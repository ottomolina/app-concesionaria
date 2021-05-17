import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:app_concesionario/src/models/concesionarioModel.dart';
import 'package:app_concesionario/src/models/loginModel.dart';
import 'package:app_concesionario/src/providers/concesionarioProvider.dart';
import 'package:app_concesionario/src/providers/usuarioProvider.dart';
import 'package:app_concesionario/src/util/loadingOverlay.dart';
import 'package:app_concesionario/src/util/storage.dart';
import 'package:app_concesionario/src/util/util.dart';

class LoginPage extends StatefulWidget {
  static final pageName = 'login';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _store = new Storage();
  final _usuarioProv = new UsuarioProvider();
  final _concesionarioProv = new ConcesionarioProvider();
  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _loginForm());
  }

  Widget _loginForm() {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      children: <Widget>[
        Image.asset(
          'assets/logo.png',
          width: 300,
          height: 300,
        ),
        TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                hintText: 'Ingrese su correo',
                labelText: 'Correo electrónico:',
                icon: Icon(Icons.email, color: Colors.blue[800])),
            keyboardType: TextInputType.emailAddress,
            onChanged: (valor) {
              _email = valor;
            }),
        Divider(),
        TextField(
          obscureText: true,
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
              hintText: 'Ingrese su contraseña',
              labelText: 'Contraseña:',
              icon: Icon(Icons.lock, color: Colors.blue[800])),
          onChanged: (valor) {
            _password = valor;
          },
        ),
        Divider(),
        Center(
          child: TextButton.icon(
              icon: Icon(Icons.input, color: Colors.white),
              onPressed: _onPresedLogin,
              style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.blue.shade800,
                  onSurface: Colors.grey),
              label: Text(
                'Ingresar',
                style: TextStyle(fontSize: 20, color: Colors.white),
              )),
        ),
      ],
    );
  }

  _onPresedLogin() {
    print('Email: $_email, pass: $_password');
    if ((_email != null && _email != '') &&
        (_password != null && _password != '')) {
      _log().then((value) {
        Navigator.pushReplacementNamed(context, 'home');
      }, onError: (error) {
        mostrarMensaje(context, error);
      });
    } else {
      mostrarMensaje(
          context, 'Aún no completas tus credenciales para acceder.');
    }
  }

  Future _log() async {
    final overlay = LoadingOverlay.of(context);
    final result = await overlay.during(_loguearse());
    return result;
  }

  Future _loguearse() async {
    UsuarioModel model = new UsuarioModel();
    model.correo = _email;
    model.password = _password;
    LoginModel login = await _usuarioProv.login(model);
    if (login.usuario.concesionarioid == '') {
      return Future.error(
          'Tu usuario no tiene asignado un concesionario, para continuar debes asignarte en la web.');
    }
    await _store.setToken(login.token);
    await _store.setUsuario(jsonEncode(login.usuario));
    Concesionario concesionario = await _concesionarioProv
        .getConcesionarioById(login.usuario.concesionarioid);
    await _store.setConcesionario(jsonEncode(concesionario));
  }
}
