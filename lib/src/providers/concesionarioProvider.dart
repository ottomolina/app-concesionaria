import 'package:app_concesionario/src/models/concesionarioModel.dart';
import 'package:app_concesionario/src/providers/httpProvider.dart';

class ConcesionarioProvider {
  final _root = '/concesionario';
  final _http = new HttpProvider();

  Future<Concesionario> getConcesionarioById(String id) async {
    final sender = <String, String>{'id': id};
    final response = await _http.get('$_root/getconcesionario', sender);
    Concesionario concesionario = Concesionario.fromJson(response.data);
    return concesionario;
  }
}
