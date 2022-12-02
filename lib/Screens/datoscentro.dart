import 'package:flutter/material.dart';
import 'package:movil_proyecto/Screens/planactividades.dart';
import 'package:movil_proyecto/Screens/datosencargado.dart';

class DatosCentroRoute extends StatefulWidget {
  final int idpractica;
  final String nombresupervisor;
  final String telefonosupervisor;
  final String correosupervisor;
  final int idpostulante;
  const DatosCentroRoute(
      {super.key,
      required this.idpostulante,
      required this.idpractica,
      required this.nombresupervisor,
      required this.telefonosupervisor,
      required this.correosupervisor});

  @override
  State<DatosCentroRoute> createState() => _DatosCentroRouteState();
}

class _DatosCentroRouteState extends State<DatosCentroRoute> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController namecentro = TextEditingController();
  TextEditingController departamentocentro = TextEditingController();
  TextEditingController provinciacentro = TextEditingController();
  TextEditingController distritocentro = TextEditingController();
  TextEditingController direccioncentro = TextEditingController();

  TextEditingController namerem = TextEditingController();
  TextEditingController cargorem = TextEditingController();
  TextEditingController correorem = TextEditingController();
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

  @override
  void initState() {
    print(widget.idpractica);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      appBar: ApplicationToolbar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: _formKey,
            child: Center(
              child: Column(
                children: <Widget>[
                  titlebox("DATOS DEL CENTRO DE PRÁCTICAS"),
                  textbox("Nombre del centro de prácticas", namecentro),
                  textbox("Departamento", departamentocentro),
                  textbox("Provincia", provinciacentro),
                  textbox("Distrito", distritocentro),
                  textbox("Dirección", direccioncentro),
                  Divider(
                    thickness: 3,
                    color: Colors.transparent,
                  ),
                  titlebox("DATOS DEL ASISTENTE ENCARGADO"),
                  textbox("Nombres y Apeliidos", namerem),
                  textbox("Cargo", cargorem),
                  textbox("Correo electrónico", correorem),
                  Divider(
                    thickness: 3,
                    color: Colors.transparent,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.07,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    print("Datos Completos");
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              PlanActividadesRoute(
                                                idpostulante:
                                                    widget.idpostulante,
                                                idpractica: widget.idpractica,
                                                nombresupervisor:
                                                    widget.nombresupervisor,
                                                telefonosupervisor:
                                                    widget.telefonosupervisor,
                                                correosupervisor:
                                                    widget.correosupervisor,
                                                namecentro: namecentro.text,
                                                departamentocentro:
                                                    departamentocentro.text,
                                                provinciacentro:
                                                    provinciacentro.text,
                                                distritocentro:
                                                    distritocentro.text,
                                                direccioncentro:
                                                    direccioncentro.text,
                                                namerem: namerem.text,
                                                cargorem: cargorem.text,
                                                correorem: correorem.text,
                                              )),
                                    );
                                  } else {
                                    print("Datos Incompletos");
                                  }
                                },
                                child: Text('Siguiente'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Color.fromRGBO(1, 71, 118, 1),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
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
