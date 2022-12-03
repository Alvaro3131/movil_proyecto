import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';
import 'package:movil_proyecto/Screens/datosencargado.dart';
import 'package:movil_proyecto/Screens/revisarsolicitud/home_revisar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:movil_proyecto/Screens/reportes.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';

class Homepage extends StatefulWidget {
  final int validacion;

  const Homepage({required this.validacion});
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String user = "";
  String dni = "";
  String codigo = "";
  String ciclo = 'Nutricion Humana';
  int _paginaactual = 0;
  String vcomunitarias = "";

  String vclinicas = "";
  int solactivo = 0;
  int hcomunitarias = 0;
  int hclinicas = 0;
  int id = 0;
  @override
  void initState() {
    mostrardatos().then((value) {
      setState(() {
        user = user;
        print(id);
      });
    });
  }

  Future<void> mostrardatos() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String username = prefs.getString("name")!;
    int idp = int.parse(prefs.getString("id")!);

    String dnip = prefs.getString("dni")!;
    String idrol = prefs.getString("idrol")!;
    String codigop = prefs.getString("codigo")!;
    String vcomunitariaspp = prefs.getString("vcomuntiraias")!;

    String vclinicasp = prefs.getString("vclinicas")!;
    int solactivop = int.parse(prefs.getString("solactivo")!);
    int hcomunitariasp = int.parse(prefs.getString("hcomunitarias")!);
    int hclinicasp = int.parse(prefs.getString("hclinicas")!);
    setState(() {
      user = username;
      dni = dnip;
      codigo = codigop;
      vcomunitarias = vcomunitariaspp;
      vclinicas = vclinicasp;
      solactivo = solactivop;
      hcomunitarias = hcomunitariasp;
      hclinicas = hclinicasp;
      id = idp;
    });
  }

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
      body: _paginaactual == 0
          ? SolicitudesPage(
              id: id,
              solactivo: solactivo,
              vclinicasM: vclinicas,
              vcomunitarias: vcomunitarias,
              validacion: widget.validacion,
            )
          : reportesPage(
              horasclinicas: hclinicas,
              horascomunitarias: hcomunitarias,
            ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _paginaactual,
          onTap: (index) {
            setState(() {
              print(user);
              _paginaactual = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.description), label: "Solicitudes"),
            BottomNavigationBarItem(
                icon: Icon(Icons.trending_up), label: "Reportes")
          ]),
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
                                      'Escuela:',
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
                                      codigo,
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
                                      dni,
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
                            onPressed: () async {
                              SharedPreferences preferences =
                                  await SharedPreferences.getInstance();
                              await preferences.clear();
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

class SolicitudesPage extends StatefulWidget {
  final int id;
  final int solactivo;
  final String vcomunitarias;
  final String vclinicasM;
  final int validacion;
  const SolicitudesPage(
      {super.key,
      required this.id,
      required this.solactivo,
      required this.vcomunitarias,
      required this.vclinicasM,
      required this.validacion});

  @override
  State<SolicitudesPage> createState() => _SolicitudesPageState();
}

class _SolicitudesPageState extends State<SolicitudesPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            // Container(
            //   height: size.height * 0.2,
            //   child: Stack(
            //     children: <Widget>[
            //       Container(
            //         height: size.height * 0.2 - 27,
            //         decoration: BoxDecoration(
            //             color: const Color.fromRGBO(1, 71, 118, 1),
            //             borderRadius: BorderRadius.only(
            //                 bottomLeft: Radius.circular(700),
            //                 bottomRight: Radius.circular(700))),
            //       )
            //     ],
            //   ),
            // ),
            const Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 20)),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: MaterialButton(
                onPressed: () {
                  if (widget.solactivo == 0 && widget.validacion == 0) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DatosEncargadoRoute(
                                idpostulante: widget.id,
                                vclinicas: widget.vclinicasM,
                                vcomunitarias: widget.vcomunitarias,
                              )),
                    );
                  } else {
                    Fluttertoast.showToast(
                        msg: "Actualmente tiene una solicitud activa",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Color.fromRGBO(1, 71, 118, 1),
                        textColor: Colors.white,
                        fontSize: 16.0);
                  }
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
                              color: Colors.white, fontWeight: FontWeight.bold),
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RevisarSolicitud(
                              idpostulante: widget.id,
                            )),
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
                      child: Center(
                        child: Text(
                          'REVISAR ESTADO',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
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
    );
  }
}
