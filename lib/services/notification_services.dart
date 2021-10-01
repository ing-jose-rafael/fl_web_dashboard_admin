import 'package:flutter/material.dart';

class NotificationsService {
  static GlobalKey<ScaffoldMessengerState> messengerKey = new GlobalKey<ScaffoldMessengerState>();
  static showSnackBarError(String mensaje) {
    final snackBar = SnackBar(
      backgroundColor: Colors.red.withOpacity(0.9),
      content: Text(mensaje, style: TextStyle(color: Colors.white)),
    );
    messengerKey.currentState!.showSnackBar(snackBar);
  }

  static showSnackBarOk(String mensaje) {
    final snackBar = SnackBar(
      backgroundColor: Colors.green.withOpacity(0.9),
      content: Text(mensaje, style: TextStyle(color: Colors.white)),
    );
    messengerKey.currentState!.showSnackBar(snackBar);
  }
}
