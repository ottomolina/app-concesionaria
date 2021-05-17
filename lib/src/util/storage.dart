import 'package:localstorage/localstorage.dart';

class Storage {
  LocalStorage localStorage = new LocalStorage('app.concesionario');

  get usuario {
    return localStorage.getItem('usuario') ?? '';
  }

  cierraSesion() async {
    await localStorage.deleteItem('usuario');
    await localStorage.deleteItem('token');
    await localStorage.deleteItem('concesionario');
  }

  setUsuario(String value) async {
    await localStorage.setItem('usuario', value);
  }

  get token {
    return localStorage.getItem('token') ?? '';
  }

  setToken(String value) async {
    await localStorage.setItem('token', value);
  }

  get concesionario {
    return localStorage.getItem('concesionario') ?? '';
  }

  setConcesionario(String value) async {
    await localStorage.setItem('concesionario', value);
  }
}
