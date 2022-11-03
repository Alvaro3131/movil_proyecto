import 'package:flutter/material.dart';
import 'package:movil_proyecto/routes/routes.dart';

import './Login/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      initialRoute: RouterManager.login,
      onGenerateRoute: RouterManager.generateRoute,
    );
  }
}
