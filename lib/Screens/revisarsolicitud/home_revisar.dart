import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';

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
        backgroundColor: const Color.fromRGBO(1, 71, 118, 1),
        title: const Text("Registrar Solicitud"),
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
                Button(
                  onPressed: () {},
                  title: "Practicas Comunitarias",
                ),
                Container(
                  height: 20,
                ),
                Button(
                  onPressed: () {},
                  title: "Practicas Clinicas",
                ),
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

  Button({required this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.65,
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
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            decoration: BoxDecoration(
                color: const Color.fromRGBO(1, 71, 118, 1),
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
    );
  }
}
