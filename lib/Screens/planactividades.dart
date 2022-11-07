import 'package:flutter/material.dart';
import 'package:movil_proyecto/Screens/Home.dart';

class PlanActividadesRoute extends StatefulWidget {
  @override
  State<PlanActividadesRoute> createState() => _PlanActividadesRouteState();
}

class _PlanActividadesRouteState extends State<PlanActividadesRoute> {
  String _fecha = '';
  TextEditingController _textController = new TextEditingController();

  String _fechaf = '';
  TextEditingController _textControllerf = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(1, 71, 118, 1),
        title: Text("Registrar Solicitud"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Divider(),
            const Text(
              'PLAN DE ACTIVIDADES',
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(1, 71, 118, 1)),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: _selectStartDate(context),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: _selectEndDate(context),
                  )
                ],
              ),
            ),

            // const Align(
            //   alignment: FractionalOffset(0.2, 0.2),
            //   child: Text('DATOS DEL ENCARGADO'),
            // ),
            // const Padding(
            //   padding: EdgeInsets.only(
            //       left: 5,
            //       bottom: 20,
            //       right: 20,
            //       top: 10), //apply padding to some sides only
            //   child: Text("Hello World, Text 2"),
            // ),
            Divider(
              color: Colors.transparent,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Homepage()),
                );
              },
              child: Text('Enviar Solicitud'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(1, 71, 118, 1),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _selectStartDate(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _textController,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: 'Seleccione la fecha de inicio aquí',
        labelText: 'Seleccione la Fecha Inicio',
        // helperText: 'Seleccione solo la fecha de nacimiento',
        suffixIcon: Icon(Icons.calendar_today),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selecDateStart(context);
      },
    );
  }

  _selecDateStart(BuildContext context) async {
    DateTime? _selecday = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2019),
        lastDate: DateTime(2029));
    if (_selecday != null) {
      setState(() {
        _fecha = _selecday.toString();
        _textController.text = _fecha;
      });
    }
  }

  Widget _selectEndDate(BuildContext context) {
    return TextField(
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
