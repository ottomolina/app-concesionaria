import 'package:app_concesionario/src/models/clienteModel.dart';
import 'package:app_concesionario/src/providers/httpProvider.dart';

class ClienteProvider {
  final String _root = '/cliente';
  final HttpProvider _http = new HttpProvider();

  Future<Cliente> crearCliente(Cliente model) async {
    final datos = model.toJson();
    final response = await _http.post('$_root/guardar', datos);
    Cliente cliente = Cliente.fromJson(response.data);
    return cliente;
  }

  Future<List<Cliente>> listaCliente() async {
    final response = await _http.get('$_root/listado');
    ClienteLista clienteLista = ClienteLista.fromJson(response.data);
    return clienteLista.lista;
  }

  Future<bool> actualizarCliente(Cliente model) async {
    final datos = model.toJson();
    await _http.put('$_root/actualizar/${model.id}', datos);
    return true;
  }
}
