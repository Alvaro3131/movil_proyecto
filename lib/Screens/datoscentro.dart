import 'package:flutter/material.dart';
import 'package:movil_proyecto/Screens/planactividades.dart';

class DatosCentroRoute extends StatelessWidget {
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
              'DATOS DEL CENTRO DE PRÁCTICAS',
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(1, 71, 118, 1)),
            ),
            SizedBox(
              //height: 60.0,
              child: Padding(
                padding: const EdgeInsets.only(left: 12, right: 12, top: 10),
                child: TextFormField(
                  enableInteractiveSelection: false,
                  textCapitalization: TextCapitalization.characters,
                  decoration: InputDecoration(
                    fillColor: Color.fromARGB(255, 255, 255, 255),
                    filled: true,
                    hintText: 'Nombre de la Institución',
                    labelText: 'Nombre de la Institución',
                    suffixIcon: Icon(Icons.verified_user_sharp),
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
                    hintText: 'Número de RUC',
                    labelText: 'RUC',
                    suffixIcon: Icon(Icons.verified_user_sharp),
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
                    hintText: 'Dirección',
                    labelText: 'Dirección',
                    suffixIcon: Icon(Icons.verified_user_sharp),
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
                  MaterialPageRoute(
                      builder: (context) => PlanActividadesRoute()),
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
    );
  }
}
