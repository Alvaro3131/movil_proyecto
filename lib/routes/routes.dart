import 'package:flutter/material.dart';
import 'package:movil_proyecto/Login/login.dart';
import 'package:movil_proyecto/Screens/Home.dart';

class RouterManager {
  static const String homepage = '/';
  static const String login = '/login';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homepage:
        return MaterialPageRoute(
          builder: (context) => const Homepage(),
        );
      case login:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );
      default:
        throw FormatException('Ruta no encontrada');
    }
  }
}
