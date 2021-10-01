import 'package:admin_dashboard/api/cafe_api.dart';
import 'package:admin_dashboard/models/http/users_response.dart';
import 'package:admin_dashboard/models/usuario_model.dart';
import 'package:flutter/material.dart';

class UsersProvider extends ChangeNotifier {
  List<Usuario> users = [];
  bool isLoading = true;
  /** en el momento que alquien requiera mi user provider quiero que se haga la petición  getUsers */
  UsersProvider() {
    this.getUsers();
  }
  getUsers() async {
    //petición ala Api
    final resp = await CafeApi.httpGet('/usuario?limite=100'); // retorna un mapa
    final usersResponse = UsersResponse.fromMap(resp);
    this.users = [...usersResponse.usuarios];
    isLoading = false;
    // print(usersResponse.total);
    // print(usersResponse.usuarios.length);
    notifyListeners();
  }
}
