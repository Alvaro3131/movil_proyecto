import 'package:flutter/material.dart';
import 'package:movil_proyecto/Screens/datoscentro.dart';

class DatosEncargadoRoute extends StatefulWidget {
  final int idpostulante;
  final String vcomunitarias;
  final String vclinicas;
  const DatosEncargadoRoute(
      {super.key,
      required this.idpostulante,
      required this.vcomunitarias,
      required this.vclinicas});

  @override
  State<DatosEncargadoRoute> createState() => _DatosEncargadoRouteState();
}

class ApplicationToolbar extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: const Color.fromRGBO(1, 71, 118, 1),
        title: Text("Registrar Solicitud"));
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _DatosEncargadoRouteState extends State<DatosEncargadoRoute> {
  String gender = "Selecione el tipo de prácticas";
  List<String> listOfValue = [
    "Selecione el tipo de prácticas",
  ];
  final _formKey = GlobalKey<FormState>();

  Widget titlebox(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: Text(
        title,
        textAlign: TextAlign.left,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
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

  @override
  void initState() {
    if (widget.vclinicas == '1') {
      listOfValue.add("Practicas Clinicas");
    }
    if (widget.vcomunitarias == '1') {
      listOfValue.add("Practicas Comunitarias");
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: ApplicationToolbar(),
      body: SingleChildScrollView(
        child: Padding(
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
                      items: listOfValue.map((val) {
                        return DropdownMenuItem(
                          value: val,
                          child: Text(
                            val,
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  titlebox("DATOS DEL NUTRICIONISTA"),
                  Divider(
                    thickness: 3,
                    color: Colors.transparent,
                  ),
                  textbox("Nombres y Apellidos"),
                  textbox("Nro de Telefono"),
                  textbox("Correo Electrónico"),
                  Divider(
                    thickness: 3,
                    color: Colors.transparent,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.07,
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            print("Datos Completos");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DatosCentroRoute(
                                        idpostulante: widget.idpostulante,
                                      )),
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
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
