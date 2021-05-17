import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:app_concesionario/src/models/responseModel.dart';
import 'package:app_concesionario/src/models/errorModel.dart';
import 'package:app_concesionario/variables.dart' as variables;

import 'package:app_concesionario/src/util/storage.dart';

const OK = 0;
const ERROR = 1;

class HttpProvider {
  final Storage _store = new Storage();
  final String _rootUrl = variables.rootUrl;
  final String _api = 'rest/api';

  Map<String, String> _headers = <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
  };

  Future<ResponseModel> post(String path, Map<String, dynamic> datos) async {
    final uri = Uri.https(_rootUrl, '$_api$path');
    if (_store.token != '') {
      _headers['x-token'] = _store.token;
    }
    final result =
        await http.post(uri, headers: _headers, body: jsonEncode(datos));

    ResponseModel response = await _procesarRespuesta(result);
    return response;
  }

  Future<ResponseModel> get(String path,
      [Map<String, dynamic> queryParams]) async {
    Uri uri;
    if (queryParams == null) {
      uri = Uri.https(_rootUrl, '$_api$path');
    } else {
      uri = Uri.https(_rootUrl, '$_api$path', queryParams);
    }
    if (_store.token != '') {
      _headers['x-token'] = _store.token;
    }
    final result = await http.get(uri, headers: _headers);

    ResponseModel response = await _procesarRespuesta(result);
    return response;
  }

// Utilizado solo para actualizacion de registros
  Future<ResponseModel> put(String path, Map<String, dynamic> datos) async {
    final uri = Uri.https(_rootUrl, '$_api$path');
    if (_store.token != '') {
      _headers['x-token'] = _store.token;
    }
    final result =
        await http.put(uri, headers: _headers, body: jsonEncode(datos));

    ResponseModel response = await _procesarRespuesta(result);
    return response;
  }

  Future<ResponseModel> _procesarRespuesta(http.Response result) async {
    ResponseModel response = ResponseModel.fromJson(jsonDecode(result.body));
    if (result.statusCode == 200) {
      switch (response.codigo) {
        case OK:
          break;
        case ERROR:
          return Future.error(response.mensaje);
          break;
        default:
          return Future.error('No se obtuvo respuesta del servidor.');
          break;
      }
    } else if (result.statusCode == 400) {
      // Vienen mensajes de error del body de entrada
      final error = ResponseModel.fromJson(jsonDecode(result.body)).mensaje;
      ErrorModel errores = ErrorModel.fromJson(error);
      // Solo se devuelve el primer mensaje
      final mensaje = errores.errors.first.msg;
      return Future.error(mensaje);
    } else if (result.statusCode == 401) {
      // La petición no tiene el token de autorización o el token expiró
      final mensaje = ResponseModel.fromJson(jsonDecode(result.body)).mensaje;
      return Future.error(mensaje);
    } else {
      return Future.error('Ocurrió un error al conectar con el servidor.');
    }
    return response;
  }
}
