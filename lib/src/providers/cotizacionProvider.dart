import 'package:app_concesionario/src/models/clienteModel.dart';
import 'package:app_concesionario/src/models/cotizacionModel.dart';
import 'package:app_concesionario/src/providers/httpProvider.dart';

class CotizacionProvider {
  final String _root = '/cotizacion';
  final HttpProvider _http = new HttpProvider();

  Future<List<Cliente>> getClientesCotizacion() async {
    final response = await _http.get('$_root/get-cliente');
    ClienteCotizacion clienteCotizacion =
        ClienteCotizacion.fromJson(response.data);
    return clienteCotizacion.lista;
  }

  Future<List<Cotizacion>> getListadoCotizacion(String clienteid) async {
    final datos = <String, String>{'clienteid': clienteid};
    final response = await _http.get('$_root/listado', datos);
    CotizacionModel cotizacionModel = CotizacionModel.fromJson(response.data);
    return cotizacionModel.lista;
  }

  Future<Cotizacion> crearCotizacion(Cotizacion cotizacion) async {
    final datos = <String, dynamic>{
      'cliente': cotizacion.cliente.toJson(),
      'vehiculo': cotizacion.vehiculo.toJson()
    };
    final response = await _http.post('$_root/guardar', datos);
    Cotizacion obj = Cotizacion.fromJson(response.data);
    return obj;
  }
}
