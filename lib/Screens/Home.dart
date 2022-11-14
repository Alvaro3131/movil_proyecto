import 'package:flutter/material.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';
import 'package:movil_proyecto/Screens/datosencargado.dart';
import 'package:url_launcher/url_launcher.dart';

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String user = 'Alvaro Alva Chipana';
  String ciclo = '6';
  int _paginaactual = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(1, 71, 118, 1),
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
              const Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 20)),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DatosEncargadoRoute()),
                    );
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.65,
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
                        width: MediaQuery.of(context).size.width * 0.50,
                        padding: EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 12.0),
                        child: const Center(
                          child: Text(
                            'AÑADIR SOLICITUD',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(1, 71, 118, 1),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(95.0),
                                topLeft: Radius.circular(95.0),
                                bottomRight: Radius.circular(400.0))),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.10,
                        child: Center(
                          child: Icon(
                            Icons.post_add,
                            size: 30.0,
                            color: const Color.fromRGBO(1, 71, 118, 1),
                          ),
                        ),
                      )
                    ]),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: MaterialButton(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => DatosEncargadoRoute()),
                    // );
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.65,
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
                        width: MediaQuery.of(context).size.width * 0.50,
                        padding: EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 12.0),
                        child: Center(
                          child: Text(
                            'REVISAR ESTADO',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 153, 0),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(95.0),
                                topLeft: Radius.circular(95.0),
                                bottomRight: Radius.circular(400.0))),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.10,
                        child: Center(
                          child: Icon(
                            Icons.visibility,
                            size: 30.0,
                            color: const Color.fromARGB(255, 255, 153, 0),
                          ),
                        ),
                      )
                    ]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _paginaactual,
        onTap: (index){
          setState(() {
            _paginaactual = index;
          });
        },
        items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.description), label: "Solicitudes"),
        BottomNavigationBarItem(
            icon: Icon(Icons.trending_up), label: "Reportes")
      ]
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
                          margin: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height / 50),
                          child: CircleAvatar(
                            backgroundImage: AssetImage('assets/profile.png'),
                            radius: 70,
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 5,
                        child: Container(
                          child: Scaffold(
                              backgroundColor: Colors.transparent,
                              body: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(top: 20, left: 20),
                                    child: Text(
                                      'Nombre:',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 20, top: 5),
                                    child: Text(
                                      '$user',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 19),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 20, left: 20),
                                    child: Text(
                                      'Ciclo:',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 20, top: 5),
                                    child: Text(
                                      '$ciclo',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 19),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 20, left: 20),
                                    child: Text(
                                      'Codigo:',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 20, top: 5),
                                    child: Text(
                                      '202011227',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 19,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 20, left: 20),
                                    child: Text(
                                      'DNI:',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 20, top: 5),
                                    child: Text(
                                      '73057953',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 19,
                                      ),
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
                      Divider(
                        color: Colors.transparent,
                      ),
                      Flexible(
                        flex: 1,
                        child: Center(
                          child: Container(
                            margin: EdgeInsets.only(top: 20),
                            padding: EdgeInsets.only(right: 10),
                            child: GestureDetector(
                                onTap: () async {
                                  final Uri url = Uri.parse(
                                      'https://lamb-learning.upeu.edu.pe/pages/dashboard');
                                  if (!await launchUrl(
                                    url,
                                    mode: LaunchMode.externalApplication,
                                  )) {
                                    throw 'Could not launch $url';
                                  }
                                },
                                child: Image.asset(
                                  'assets/lamb.png',
                                  height: 60,
                                )),
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
