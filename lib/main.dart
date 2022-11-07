import 'package:flutter/material.dart';
import 'package:movil_proyecto/Screens/Home.dart';

import './Login/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        // Cuando naveguemos hacia la ruta "/", crearemos el Widget FirstScreen
        '/': (context) => LoginMobile(),
        // Cuando naveguemos hacia la ruta "/second", crearemos el Widget SecondScreen
        '/home': (context) => Homepage(),
      },
    );
  }
}
