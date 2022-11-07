import 'package:flutter/material.dart';
import 'package:movil_proyecto/Screens/datoscentro.dart';

class DatosEncargadoRoute extends StatefulWidget {
  @override
  State<DatosEncargadoRoute> createState() => _DatosEncargadoRouteState();
}

class _DatosEncargadoRouteState extends State<DatosEncargadoRoute> {
  String _vista = 'Selecione una Opción';
  var _lista = [
    'Selecione una Opción',
    'Prácticas Sector Público',
    'Prácticas Sector Privado'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(1, 71, 118, 1),
        title: Text("Registrar Solicitud"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            children: <Widget>[
              const Text(
                'TIPO DE PRÁCTICAS',
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(1, 71, 118, 1)),
              ),
              Container(
                margin: const EdgeInsets.all(10.0),
                height: 50.0,
                width: 240.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Color.fromARGB(255, 53, 53, 53),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(children: [
                  DropdownButton(
                    items: _lista.map((String a) {
                      return DropdownMenuItem(value: a, child: Text(a));
                    }).toList(),
                    onChanged: (_value) => {
                      setState(() {
                        _vista = _value.toString();
                      })
                    },
                    hint: Text(_vista),
                    // icon: const Icon(
                    //   Icons.arrow_downward,
                    //   size: 15,
                    // ),
                    underline: Container(height: 0),
                    borderRadius: BorderRadius.circular(20),
                    elevation: 30,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 71, 71, 71),
                    ),
                  ),
                ]),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: const Text(
                  'DATOS DEL ENCARGADO',
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(1, 71, 118, 1)),
                ),
              ),
              SizedBox(
                //height: 60.0,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 12,
                    right: 12,
                    top: 10,
                  ),
                  child: TextFormField(
                    enableInteractiveSelection: false,
                    textCapitalization: TextCapitalization.characters,
                    decoration: InputDecoration(
                      fillColor: Color.fromARGB(255, 255, 255, 255),
                      filled: true,
                      hintText: 'Nombres y Apellidos',
                      labelText: 'Nombres y Apellidos',
                      suffixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    // controller: username,
                    // onSubmitted: (String valor) {
                    //   setState(() {
                    //     nombre = valor;
                    //   });
                    // },
                  ),
                ),
              ),
              SizedBox(
                child: Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12, top: 10),
                  child: TextFormField(
                    enableInteractiveSelection: false,
                    textCapitalization: TextCapitalization.characters,
                    decoration: InputDecoration(
                      fillColor: Color.fromARGB(255, 255, 255, 255),
                      filled: true,
                      hintText: 'Número de DNI',
                      labelText: 'DNI',
                      suffixIcon: Icon(Icons.badge),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
              ),
              SizedBox(
                child: Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12, top: 10),
                  child: TextFormField(
                    enableInteractiveSelection: false,
                    textCapitalization: TextCapitalization.characters,
                    decoration: InputDecoration(
                      fillColor: Color.fromARGB(255, 255, 255, 255),
                      filled: true,
                      hintText: 'Correo Electrónico',
                      labelText: 'Correo Electrónico',
                      suffixIcon: Icon(Icons.mail),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
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
                    MaterialPageRoute(builder: (context) => DatosCentroRoute()),
                  );
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
    );
  }
}
