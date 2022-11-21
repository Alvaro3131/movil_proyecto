import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class RevisarSolicitud extends StatefulWidget {
  const RevisarSolicitud({super.key});

  @override
  State<RevisarSolicitud> createState() => _RevisarSolicitudState();
}

class _RevisarSolicitudState extends State<RevisarSolicitud> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(1, 71, 118, 1),
        title: const Text("Registrar Solicitud"),
      ),
    );
  }
}
