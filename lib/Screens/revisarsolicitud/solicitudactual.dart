import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SolicitudActual extends StatelessWidget {
  const SolicitudActual({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController namecentro = TextEditingController();
    Widget titlebox(String title) {
      return Padding(
        padding: const EdgeInsets.only(top: 18.0),
        child: Text(
          title,
          textAlign: TextAlign.left,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(1, 71, 118, 1)),
        ),
      );
    }

    Widget textbox(String description, TextEditingController controller) {
      return Padding(
        padding: const EdgeInsets.only(left: 12, right: 12, top: 15),
        child: TextFormField(
          controller: controller,
          validator: (value) => value!.isEmpty ? "Campo requerido" : null,
          decoration: InputDecoration(
            fillColor: const Color.fromARGB(255, 255, 255, 255),
            filled: true,
            hintText: description,
            labelText: description,
            suffixIcon: const Icon(Icons.verified_user_sharp),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
      );
    }

    namecentro.text = "ASasas";

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(1, 71, 118, 1),
        title: Text("Solicitud Actual"),
      ),
      body: Container(
          padding: EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(children: <Widget>[
              Row(children: [
                Container(
                    width: 150,
                    height: 150,
                    child: Icon(
                      Icons.dashboard_customize_outlined,
                      size: 150,
                    )),
                Column(
                  children: [
                    titlebox("Estado: Registrado"),
                    titlebox("Feha Registro: 20/05/2021"),
                    titlebox("Feha Inicio: 20/05/2021")
                  ],
                )
              ]),
              textbox("description", namecentro),
              textbox("description", namecentro),
              textbox("description", namecentro),
              textbox("description", namecentro),
              textbox("description", namecentro),
              textbox("description", namecentro),
              textbox("description", namecentro),
              textbox("description", namecentro),
              ElevatedButton(onPressed: () {}, child: Text("asasas"))
            ]),
          )),
    );
  }
}
