import 'package:flutter/material.dart';
import 'package:movil_proyecto/Screens/datoscentro.dart';

class DatosEncargadoRoute extends StatefulWidget {
  const DatosEncargadoRoute({super.key});

  @override
  State<DatosEncargadoRoute> createState() => _DatosEncargadoRouteState();
}

class _DatosEncargadoRouteState extends State<DatosEncargadoRoute> {
  String _vista = 'Selecione una Opción';
  final _lista = [
    'Seleccione una Opción',
    'Prácticas Comunitarias',
    'Prácticas Clínicas'
  ];

  String gender = "Selecione el tipo de prácticas";

  final _formKey = GlobalKey<FormState>();

  Widget titlebox(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: Text(
        title,
        textAlign: TextAlign.left,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            fontWeight: FontWeight.bold, color: Color.fromRGBO(1, 71, 118, 1)),
      ),
    );
  }

  Widget textbox(String description) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, top: 15),
      child: TextFormField(
        validator: (value) => value!.isEmpty ? "Campo requerido" : null,
        decoration: InputDecoration(
          fillColor: Color.fromARGB(255, 255, 255, 255),
          filled: true,
          hintText: description,
          labelText: description,
          suffixIcon: Icon(Icons.verified_user_sharp),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(1, 71, 118, 1),
        title: const Text("Registrar Solicitud"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: Center(
            child: Column(
              children: <Widget>[
                titlebox("TIPO DE PRÁCTICAS"),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: DropdownButtonFormField(
                    validator: (value) =>
                        value == "Selecione el tipo de prácticas"
                            ? "Campo requerido"
                            : null,
                    onChanged: (String? v) {
                      setState(() {
                        gender = v!;
                      });
                    },
                    value: gender,
                    items: [
                      "Selecione el tipo de prácticas",
                      "Prácticas Comunitarias",
                      "Prácticas Clínicas"
                    ]
                        .map((v) => DropdownMenuItem(
                              child: Text(v),
                              value: v,
                            ))
                        .toList(),
                  ),
                ),
                titlebox("DATOS DEL NUTRICIONISTA"),
                Divider(
                  thickness: 3,
                  color: Colors.transparent,
                ),
                textbox("Nombres y Apellidos"),
                textbox("Nro de DNI"),
                textbox("Correo Electrónico"),
                Divider(
                  thickness: 3,
                  color: Colors.transparent,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      print("Datos Completos");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DatosCentroRoute()),
                      );
                    } else {
                      print("Datos Incompletos");
                    }
                  },
                  child: Text('Siguiente'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(1, 71, 118, 1),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
