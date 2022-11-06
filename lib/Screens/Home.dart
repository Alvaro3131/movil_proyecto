import 'package:flutter/material.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
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
