import 'package:admin_dashboard/api/cafe_api.dart';
import 'package:admin_dashboard/models/usuario_model.dart';
import 'package:flutter/material.dart';

class UserFormProvider extends ChangeNotifier {
  // necesito mantener la información del usuario
  Usuario? user; // usuario opcional
  GlobalKey<FormState> formKey = new GlobalKey<FormState>(); // para manejar las validaciones del formulario
  bool _statusForm = true;

  /**
   * Crear una copia recibiendo los nuevos valores y notificando
   */
  copyUserWith({
    String? rol,
    bool? estado,
    bool? google,
    String? nombre,
    String? correo,
    String? uid,
    String? img,
  }) {
    user = new Usuario(
      rol: rol ?? this.user!.rol,
      estado: estado ?? this.user!.estado,
      google: google ?? this.user!.google,
      nombre: nombre ?? this.user!.nombre,
      correo: correo ?? this.user!.correo,
      uid: uid ?? this.user!.uid,
    );
    notifyListeners();
  }

  //TODO: pensar como actualizar usuario y notificar
  Future updateUser() async {
    if (!this._validForm()) return false;
    // actualizando el usuario en backend se manda como lo pide el backend
    final data = {
      'nombre': user!.nombre,
      'correo': user!.correo,
    };
    try {
      final resp = await CafeApi.put('/usuario/${user!.uid}', data);
      print(resp);
      return true;
    } catch (e) {
      print('error en updateUser :$e');
      return false;
    }
  }

  /// funtion boleana retorna si el formulario es válido
  bool _validForm() {
    final validate = formKey.currentState!.validate();

    return validate;
  }

  set statusForm(bool value) {
    this._statusForm = value;
    notifyListeners();
  }

  bool get statusForm => this._statusForm;
}
