import 'package:app_concesionario/src/models/vehiculoModel.dart';
import 'package:app_concesionario/src/providers/httpProvider.dart';

class VehiculoProvider {
  final String _root = '/vehiculo';
  final HttpProvider _http = new HttpProvider();

  Future<Vehiculo> crearVehiculo(Vehiculo model) async {
    final datos = model.toJson();
    final response = await _http.post('$_root/guardar', datos);
    Vehiculo vehiculoModel = Vehiculo.fromJson(response.data);
    return vehiculoModel;
  }

  Future<List<Vehiculo>> listaVehiculos() async {
    final response = await _http.get('$_root/listado');
    VehiculoLista vehiculoLista = VehiculoLista.fromJson(response.data);
    return vehiculoLista.lista;
  }

  Future<bool> actualizarVehiculo(Vehiculo model) async {
    final datos = model.toJson();
    await _http.put('$_root/actualizar/${model.id}', datos);
    return true;
  }
}
