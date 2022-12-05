import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SolicitudActual extends StatelessWidget {
  var _isButtonDisabled = false;
  SolicitudActual({super.key});

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
          onChanged: (value) {
            _isButtonDisabled = true;
            print(_isButtonDisabled);
          },
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

    Widget textbox1(String description, TextEditingController controller) {
      return Padding(
        padding: const EdgeInsets.only(left: 12, right: 12, top: 15),
        child: TextFormField(
          enabled: false,
          controller: controller,
          maxLines: 10,
          minLines: 2,
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

    namecentro.text = "saaaaaaaaaa";

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
              titlebox("Obsebaciones de la Solicitud"),
              textbox1("Obserbaciones", namecentro),
              Center(
                child: Row(
                  children: [
                    IconButton(
                        onPressed:
                            _isButtonDisabled ? () => {print("object")} : null,
                        icon: Icon(Icons.abc)),
                    IconButton(onPressed: () {}, icon: Icon(Icons.abc)),
                    IconButton(onPressed: () {}, icon: Icon(Icons.abc))
                  ],
                ),
              ),
              titlebox("Centro de Practicas"),
              textbox("Nombre", namecentro),
              textbox("Departamento", namecentro),
              textbox("Provincia", namecentro),
              textbox("Distrito", namecentro),
              textbox("Direccion", namecentro),
              titlebox("Supervisor"),
              textbox("Nombre", namecentro),
              textbox("Correo", namecentro),
              textbox("Telefono", namecentro),
              titlebox("Director"),
              textbox("Nombre", namecentro),
              textbox("Cargo", namecentro),
              textbox("Telefono", namecentro),
            ]),
          )),
    );
  }
}
