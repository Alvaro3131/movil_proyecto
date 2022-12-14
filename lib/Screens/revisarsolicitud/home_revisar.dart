import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:movil_proyecto/Screens/revisarsolicitud/listado_solicitudes.dart';
import 'package:movil_proyecto/Screens/revisarsolicitud/solicitud.dart';
import 'package:movil_proyecto/Screens/revisarsolicitud/solicitudactual.dart';
import 'package:movil_proyecto/constante.dart';
import 'package:http/http.dart' as http;

class RevisarSolicitud extends StatefulWidget {
  final int idpostulante;
  const RevisarSolicitud({required this.idpostulante});

  @override
  State<RevisarSolicitud> createState() => _RevisarSolicitudState();
}

class _RevisarSolicitudState extends State<RevisarSolicitud> {
  List<Map<String, dynamic>> map = [];

  Future<void> solicitudes(int valor) async {
    int id = widget.idpostulante;
    int practica = valor;
    final response = await http.get(
      Uri.parse("$backend/api/auth/solicitud/$id/$practica"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      map = List<Map<String, dynamic>>.from(jsonDecode(response.body));
    } else {
      // ignore: avoid_print
      print("No se obtuvieron datos");
    }
  }

  Future<void> solicitudactual() async {
    int id = widget.idpostulante;

    final response = await http.get(
      Uri.parse("$backend/api/auth/solicitud/actu/$id"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      map = List<Map<String, dynamic>>.from(jsonDecode(response.body));
    } else {
      print("No se obtuvieron datos");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 3, 70, 115),
        title: const Text("Revisar Solicitudes"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            color: Colors.white,
            // Set border width
            borderRadius: BorderRadius.all(
                Radius.circular(10.0)), // Set rounded corner radius
            // Make rounded corner of border
          ),
          child: SingleChildScrollView(
              child: Center(
            child: Column(
              children: <Widget>[
                const Text(
                  "ELIGA EL TIPO DE SOLICITUD",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 102, 169),
                      fontWeight: FontWeight.bold,
                      fontSize: 17),
                ),
                Column(
                  children: [
                    Button(
                      onPressed: () {
                        solicitudes(2).then((value) {
                          print(map);
                          if (map.isEmpty) {
                            Fluttertoast.showToast(
                                msg:
                                    "Lo sentimos no cuenta con solicitudes comunitarias",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor:
                                    const Color.fromRGBO(1, 71, 118, 1),
                                textColor: Colors.white,
                                fontSize: 16.0);
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => list_solicitud(
                                        id: 1,
                                        map: map,
                                      )),
                            );
                          }
                        });
                      },
                      title: "Practicas Comunitarias",
                      color: Color.fromRGBO(1, 71, 118, 1),
                    ),
                    Button(
                        onPressed: () {
                          solicitudes(1).then((value) {
                            if (map.isEmpty) {
                              Fluttertoast.showToast(
                                  msg:
                                      "Lo sentimos no cuenta con solicitudes clinicas",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor:
                                      Color.fromRGBO(1, 71, 118, 1),
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => list_solicitud(
                                          id: 2,
                                          map: map,
                                        )),
                              );
                            }
                          });
                        },
                        title: "Practicas Clinicas",
                        color: Color.fromRGBO(109, 49, 49, 1)),
                    Button(
                        onPressed: () {
                          solicitudactual().then((value) {
                            if (map.isEmpty) {
                              Fluttertoast.showToast(
                                  msg:
                                      "Lo sentimos no cuenta con solicitudes clinicas",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor:
                                      Color.fromRGBO(1, 71, 118, 1),
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyWidget(
                                          map: map,
                                        )),
                              );
                            }
                          });
                        },
                        title: "Solicitud ACTUAL",
                        color: Color.fromARGB(255, 10, 168, 70)),
                  ],
                )
              ],
            ),
          )),
        ),
      ),
    );
  }
}

class Button extends StatelessWidget {
  final void Function() onPressed;
  final String title;
  final Color color;

  Button({required this.onPressed, required this.title, required this.color});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Center(
        child: Container(
          margin: EdgeInsets.only(top: 20),
          width: MediaQuery.of(context).size.width * 0.75,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                offset: Offset(0.0, 20.0),
                blurRadius: 30.0,
                color: Colors.black12)
          ], color: Colors.white, borderRadius: BorderRadius.circular(22.0)),
          child: Row(children: <Widget>[
            Container(
              height: 60.0,
              width: MediaQuery.of(context).size.width * 0.50,
              padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
              child: Center(
                child: Text(
                  title,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(95.0),
                      topLeft: Radius.circular(95.0),
                      bottomRight: Radius.circular(400.0))),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.10,
              child: Center(
                child: Icon(
                  Icons.remove_red_eye,
                  size: 30.0,
                  color: const Color.fromRGBO(1, 71, 118, 1),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
