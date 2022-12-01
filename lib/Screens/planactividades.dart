import 'package:flutter/material.dart';
import 'package:movil_proyecto/Screens/Home.dart';
import 'package:movil_proyecto/Screens/datoscentro.dart';

class PlanActividadesRoute extends StatefulWidget {
  final int idpostulante;
  const PlanActividadesRoute({super.key, required this.idpostulante});

  @override
  State<PlanActividadesRoute> createState() => _PlanActividadesRouteState();
}

class _PlanActividadesRouteState extends State<PlanActividadesRoute> {
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

  Widget textbox(String description) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, top: 15),
      child: TextFormField(
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(1, 71, 118, 1),
        title: const Text("Registrar Solicitud"),
      ),
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
                    textbox("Descripción del plan de actividades")
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DatosCentroRoute(
                                          idpostulante: widget.idpostulante,
                                        )),
                              );
                            },
                            child: Text('Volver atrás'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromRGBO(1, 71, 118, 1),
                              elevation: 10,
                            ),
                          ),
                        ),
                      ),
                    ),
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
                                      builder: (context) => Homepage()),
                                );
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
