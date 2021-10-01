import 'package:dio/dio.dart';
import 'package:admin_dashboard/services/local_storage.dart';

class CafeApi {
  static Dio _dio = new Dio(); // instanciando Dio

  /// Metodo para configurar Dio, que se llamara en dos lugares
  static void configuraDio() {
    // base URL
    _dio.options.baseUrl = 'http://localhost:8080/api';
    /**
     * para enviar en los headers el toquen lo buscamos 
     * en el LocalStorage en caso que no lo encuentre 
     * pasamos un String vacio 
     */
    _dio.options.headers = {'x-token': LocalStorage.prefs.getString('token') ?? ''};
  }

  static Future httpGet(String path) async {
    try {
      // realizando la peticion Http
      final resp = await _dio.get(path); // retorna un json object
      return resp.data;
    } catch (e) {
      print(e);
      throw ('Error en el GET');
    }
  }

  static Future post(String path, Map<String, dynamic> data) async {
    final formData = FormData.fromMap(data);
    try {
      // realizando la peticion Http
      final resp = await _dio.post(path, data: formData); // retorna un json object
      return resp.data;
    } catch (e) {
      print(e);
      throw ('Error en el POST');
    }
  }

  static Future put(String path, Map<String, dynamic> data) async {
    final formData = FormData.fromMap(data);
    try {
      // realizando la peticion Http
      final resp = await _dio.put(path, data: formData); // retorna un json object
      return resp.data;
    } catch (e) {
      print(e);
      throw ('Error en el PUT');
    }
  }

  static Future delete(String path) async {
    try {
      // realizando la peticion Http
      final resp = await _dio.delete(path); // retorna un json object
      return resp.data;
    } catch (e) {
      print(e);
      throw ('Error en el PUT');
    }
  }
}
