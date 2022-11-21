import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:movil_proyecto/Screens/revisarsolicitud/listado_solicitudes.dart';

class RevisarSolicitud extends StatefulWidget {
  const RevisarSolicitud({super.key});

  @override
  State<RevisarSolicitud> createState() => _RevisarSolicitudState();
}

class _RevisarSolicitudState extends State<RevisarSolicitud> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 3, 70, 115),
        title: const Text("Revisar Solicitudes"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
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
                Text(
                  "ELIGA EL TIPO DE SOLICITUD",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 102, 169),
                      fontWeight: FontWeight.bold,
                      fontSize: 17),
                ),
                Container(
                  child: Column(
                    children: [
                      Button(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => list_solicitud(
                                      id: 1,
                                    )),
                          );
                        },
                        title: "Practicas Comunitarias",
                        color: Color.fromRGBO(1, 71, 118, 1),
                      ),
                      Button(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => list_solicitud(
                                        id: 2,
                                      )),
                            );
                          },
                          title: "Practicas Clinicas",
                          color: Color.fromRGBO(109, 49, 49, 1)),
                    ],
                  ),
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
