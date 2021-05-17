import 'package:app_concesionario/src/providers/httpProvider.dart';
import 'package:app_concesionario/src/models/loginModel.dart';
import 'package:app_concesionario/src/util/util.dart';

class UsuarioProvider {
  final _http = new HttpProvider();

  Future<LoginModel> login(UsuarioModel model) async {
    final path = '/auth/login';
    final sender = <String, String>{
      'correo': model.correo,
      'password': toBase64(model.password)
    };
    print('Sender $sender');
    final response = await _http.post(path, sender);
    LoginModel ret = LoginModel.fromJson(response.data);
    return ret;
  }

  Future<UsuarioModel> getUsuarios(String usuarioid) async {
    final path = '/usuario/getusuario';
    final datos = <String, String>{'id': usuarioid};
    final response = await _http.get(path, datos);
    UsuarioModel model = UsuarioModel.fromJson(response.data);
    return model;
  }
}
