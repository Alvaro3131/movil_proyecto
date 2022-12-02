import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movil_proyecto/Screens/Home.dart';
import 'package:movil_proyecto/Screens/datoscentro.dart';
import 'package:movil_proyecto/constante.dart';
import 'package:http/http.dart' as http;

class PlanActividadesRoute extends StatefulWidget {
  final int idpostulante;
  final int idpractica;
  final String nombresupervisor;
  final String telefonosupervisor;
  final String correosupervisor;
  final String namecentro;
  final String departamentocentro;
  final String provinciacentro;
  final String distritocentro;
  final String direccioncentro;

  final String namerem;
  final String cargorem;
  final String correorem;
  const PlanActividadesRoute(
      {super.key,
      required this.idpostulante,
      required this.idpractica,
      required this.nombresupervisor,
      required this.telefonosupervisor,
      required this.correosupervisor,
      required this.namecentro,
      required this.departamentocentro,
      required this.provinciacentro,
      required this.distritocentro,
      required this.direccioncentro,
      required this.namerem,
      required this.cargorem,
      required this.correorem});

  @override
  State<PlanActividadesRoute> createState() => _PlanActividadesRouteState();
}

class _PlanActividadesRouteState extends State<PlanActividadesRoute> {
  TextEditingController detalle = TextEditingController();
  String _fecha = '';
  final TextEditingController _textController = TextEditingController();

  String _fechaf = '';
  final TextEditingController _textControllerf = TextEditingController();

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

  Widget textbox(String description, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, top: 15),
      child: TextFormField(
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

  Future<void> registrar() async {
    final response = await http.post(Uri.parse("$backend/api/auth/solicitud"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "centro": widget.namecentro,
          "direccion": widget.direccioncentro,
          "departamento": widget.departamentocentro,
          "provincia": widget.provinciacentro,
          "distrito": widget.distritocentro,
          "supnombre": widget.nombresupervisor,
          "supcorreo": widget.correosupervisor,
          "suptelefono": widget.telefonosupervisor,
          "remnombre": widget.namerem,
          "remcargo": widget.cargorem,
          "remcorreo": widget.correorem,
          "fechainicio": _fecha,
          "fechafin": _fechaf,
          "actividades": detalle.text,
          "tipoprac": widget.idpractica.toString(),
          "idpostulante": widget.idpostulante.toString()
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(1, 71, 118, 1),
        title: const Text("Registrar Solicitud"),
      ),
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
        child: Center(
          child: Column(
            children: <Widget>[
              Divider(),
              titlebox("PLAN DE ACTIVIDADES"),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 0.0),
                      child: _selectStartDate(context),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 0.0),
                      child: _selectEndDate(context),
                    ),
                    textbox("Descripción del plan de actividades", detalle)
                  ],
                ),
              ),
              Divider(
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
                                print(_fecha);
                                print(_fechaf);
                                print(detalle.text);
                                registrar().then((value) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Homepage(
                                              validacion: 1,
                                            )),
                                  );
                                });
                              } else {
                                print("Datos Incompletos");
                              }
                            },
                            child: Text('Enviar Solicitud'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromRGBO(1, 71, 118, 1),
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
    );
  }

  Widget _selectStartDate(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        enableInteractiveSelection: false,
        controller: _textController,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Seleccione la fecha de inicio aquí',
          labelText: 'Seleccione la Fecha Inicio',
          // helperText: 'Seleccione solo la fecha de nacimiento',
          suffixIcon: const Icon(Icons.calendar_today),
        ),
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
          _selecDateStart(context);
        },
      ),
    );
  }

  _selecDateStart(BuildContext context) async {
    DateTime? selecday = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2019),
        lastDate: DateTime(2029));
    if (selecday != null) {
      setState(() {
        _fecha = selecday.toString();
        _textController.text = _fecha;
      });
    }
  }

  Widget _selectEndDate(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        enableInteractiveSelection: false,
        controller: _textControllerf,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Seleccione la fecha de fin aqui',
          labelText: 'Seleccione la Fecha Fin',
          // helperText: 'Seleccione solo la fecha de nacimiento',
          suffixIcon: Icon(Icons.calendar_today),
        ),
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
          _selecDateEnd(context);
        },
      ),
    );
  }

  _selecDateEnd(BuildContext context) async {
    DateTime? _selecdayf = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2019),
        lastDate: DateTime(2029));
    if (_selecdayf != null) {
      setState(() {
        _fechaf = _selecdayf.toString();
        _textControllerf.text = _fechaf;
      });
    }
  }
}
