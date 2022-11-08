import 'package:flutter/material.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';
import 'package:movil_proyecto/Screens/datosencargado.dart';

class Homepage extends StatelessWidget {
  String user = 'Alvaro Alva Chipana';
  String ciclo = '6';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(1, 71, 118, 1),
        title: Text(user),
        actions: [
          Image.asset(
            'assets/03.png',
            width: 50,
            height: 40,
            color: Colors.white,
          ),
        ],
      ),
      body: Card(
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(padding: const EdgeInsets.fromLTRB(0, 0, 0, 20)),
              Padding(
                padding: const EdgeInsets.only(left: 38),
                child: Row(
                  children: [
                    Container(
                      height: 110,
                      width: 110,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(0.0, 20.0),
                                blurRadius: 30.0,
                                color: Colors.black12)
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(22.0)),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DatosEncargadoRoute()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(1, 71, 118, 1),
                        ),
                        child: Center(
                          // ignore: prefer_const_literals_to_create_immutables
                          child: Column(children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: const Icon(
                                Icons.app_registration,
                                color: Colors.white,
                                size: 40,
                              ),
                            ),
                            const Text(
                              "REGISTRAR SOLICITUD DE PRÁCTICAS",
                              style: TextStyle(fontSize: 12),
                              textAlign: TextAlign.center,
                            ),
                          ]),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 16.0,
                      ),
                      child: Container(
                        height: 110,
                        width: 110,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0.0, 20.0),
                                  blurRadius: 30.0,
                                  color: Colors.black12)
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(22.0)),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DatosEncargadoRoute()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(1, 71, 118, 1),
                          ),
                          child: Center(
                            // ignore: prefer_const_literals_to_create_immutables
                            child: Column(children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: const Icon(
                                  Icons.app_registration,
                                  color: Colors.white,
                                  size: 40,
                                ),
                              ),
                              const Text(
                                "REGISTRAR SOLICITUD DE PRÁCTICAS",
                                style: TextStyle(fontSize: 12),
                                textAlign: TextAlign.center,
                              ),
                            ]),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  width: 250.0,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0.0, 20.0),
                            blurRadius: 30.0,
                            color: Colors.black12)
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(22.0)),
                  child: Row(children: <Widget>[
                    Container(
                      height: 100.0,
                      width: 210.0,
                      padding: EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 12.0),
                      child: Center(
                        child: Text(
                          'REVISAR ESTADO DE MIS SOLICITUDES',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 85, 8, 8),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(95.0),
                              topLeft: Radius.circular(95.0),
                              bottomRight: Radius.circular(400.0))),
                    ),
                    Icon(
                      Icons.remove_red_eye_rounded,
                      size: 30.0,
                      color: const Color.fromARGB(255, 85, 8, 8),
                    )
                  ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  width: 250.0,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0.0, 20.0),
                            blurRadius: 30.0,
                            color: Colors.black12)
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(22.0)),
                  child: Row(children: <Widget>[
                    Container(
                      height: 100.0,
                      width: 210.0,
                      padding: EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 12.0),
                      child: Center(
                        child: Text(
                          'VER MIS REPORTES',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 102, 0),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(95.0),
                              topLeft: Radius.circular(95.0),
                              bottomRight: Radius.circular(400.0))),
                    ),
                    Icon(
                      Icons.report,
                      size: 30.0,
                      color: const Color.fromARGB(255, 255, 102, 0),
                    )
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: Drawer(
          backgroundColor: Color.fromRGBO(1, 71, 118, 1),
          child: ListView.builder(
            padding: EdgeInsets.all(0),
            itemCount: 1,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: MediaQuery.of(context).size.height,
                child: Card(
                  color: Color.fromRGBO(1, 71, 118, 1),
                  child: Column(
                    children: <Widget>[
                      Flexible(
                        flex: 2,
                        child: Container(
                          child: CircleAvatar(
                            backgroundImage: AssetImage('assets/profile.png'),
                            radius: 80,
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 6,
                        child: Container(
                          child: Scaffold(
                              backgroundColor: Colors.transparent,
                              body: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(top: 30, left: 20),
                                    child: Text(
                                      'Nombre: $user',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 19,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 30, left: 20),
                                    child: Text(
                                      'Ciclo: $ciclo',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 19),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 30, left: 20),
                                    child: Text(
                                      'Codigo: 202011227',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 19),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 30, left: 20),
                                    child: Text(
                                      'DNI: 73057953',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 19),
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Container(
                          margin: const EdgeInsets.all(5),
                          width: 120,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  '/', (Route<dynamic> route) => false);
                            },
                            child: const Text(
                              'Salir',
                              style: TextStyle(fontSize: 25),
                            ),
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                backgroundColor:
                                    Color.fromRGBO(197, 182, 52, 1)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          )),
    );
  }
}
