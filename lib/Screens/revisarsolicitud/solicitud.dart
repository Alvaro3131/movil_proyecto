import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:movil_proyecto/Screens/Home.dart';
import 'package:movil_proyecto/Screens/revisarsolicitud/home_revisar.dart';
import 'package:movil_proyecto/Screens/revisarsolicitud/web_view.dart';
import 'package:movil_proyecto/constante.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

class MyWidget extends StatefulWidget {
  final List<Map<String, dynamic>> map;
  const MyWidget({required this.map});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  String fecharegistra = "";
  String fechainicio = "";
  List<Map<String, dynamic>> soli = [];
  PlatformFile? pickedFile;
  PlatformFile? picked;
  UploadTask? upload1;
  UploadTask? upload2;
  String url1 = "";
  var checkestado = true;
  String url2 = "";
  var _isButtonDisabled = false;
  int estado = 4;
  TextEditingController namecentro = TextEditingController();
  TextEditingController observacion = TextEditingController();
  TextEditingController departamento = TextEditingController();
  TextEditingController provincia = TextEditingController();
  TextEditingController distrito = TextEditingController();
  TextEditingController direccion = TextEditingController();
  TextEditingController namesupervisor = TextEditingController();
  TextEditingController correosupervisor = TextEditingController();
  TextEditingController telefonosupervisor = TextEditingController();
  TextEditingController namedirector = TextEditingController();
  TextEditingController correodirector = TextEditingController();
  TextEditingController telefonodirector = TextEditingController();

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

  Future<void> deletesolicitud(int idsoli, int idpostulante) async {
    final response = await http.delete(
      Uri.parse("$backend/api/auth/solicitud/delete/$idsoli/$idpostulante"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
    } else {
      print("No se obtuvieron datos");
    }
  }

  Future<void> registrar() async {
    final response = await http.post(
        Uri.parse("$backend/api/auth/solicituddocumentos/documentosfinales/"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "linkinforme": url2,
          "constanciahoras": url1,
          "idsolicitud": soli[0]["id_solicitud"].toString(),
        }));
  }

  Future<void> actualizar() async {
    final response = await http.put(
        Uri.parse("$backend/api/auth/solicituddocumentos/documentosfinales/"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "linkinforme": url2,
          "constanciahoras": url1,
          "idsolicitud": soli[0]["id_solicitud"].toString(),
        }));
  }

  @override
  void initState() {
    soli = widget.map;
    estado = soli[0]["id_solestado"];
    observacion.text = soli[0]["observacion"];
    namecentro.text = soli[0]["centro_practicas"];
    departamento.text = soli[0]["departamento"];
    provincia.text = soli[0]["provincia"];
    distrito.text = soli[0]["distrito"];
    direccion.text = soli[0]["direccion"];
    namesupervisor.text = soli[0]["sup_nombre"];
    correosupervisor.text = soli[0]["sup_correo"];
    telefonosupervisor.text = soli[0]["sup_telefono"];
    namedirector.text = soli[0]["rem_nombre"];
    correodirector.text = soli[0]["rem_cargo"];
    telefonodirector.text = soli[0]["rem_correo"];
    if (soli[0]["CONSTANCIAHORAS"] == null) {
      url1 = "";
    } else {
      url1 = soli[0]["CONSTANCIAHORAS"];
    }
    if (soli[0]["INFORME"] == null) {
      url2 = "";
    } else {
      url2 = soli[0]["INFORME"];
    }

    fecharegistra =
        DateFormat.yMd().format(DateTime.parse(soli[0]["fecha_reg"]));
    fechainicio =
        DateFormat.yMd().format(DateTime.parse(soli[0]["fecha_inicio"]));
    print(soli);
    if (estado >= 3) {
      checkestado = false;
      print(checkestado);
    } else {
      checkestado = true;
    }
    super.initState();
  }

  Future selectFile() async {
    final resul = await FilePicker.platform.pickFiles();
    if (resul == null) return;
    setState(() {
      pickedFile = resul.files.first;
      print("1");
    });
  }

  Future selectFile1() async {
    final resul = await FilePicker.platform.pickFiles();
    if (resul == null) return;
    setState(() {
      picked = resul.files.first;
      print("2");
    });
  }

  Future uploadFile() async {
    final path = 'filemovil/${pickedFile!.name}';
    final file = File(pickedFile!.path!);
    final ref = FirebaseStorage.instance.ref().child(path);
    upload1 = ref.putFile(file);
    final snapshot = await upload1!.whenComplete(() {});
    final urldowload1 = await snapshot.ref.getDownloadURL();
    final path1 = 'filemovil/${picked!.name}';
    final file1 = File(picked!.path!);
    final refe = FirebaseStorage.instance.ref().child(path1);
    upload2 = refe.putFile(file1);
    final snapsh = await upload2!.whenComplete(() {});
    final urldowload2 = await snapsh.ref.getDownloadURL();
    setState(() {
      url1 = urldowload1;
      url2 = urldowload2;
    });
  }

  Future uploadFile1() async {
    final path = 'filemovil/${pickedFile!.name}';
    final file = File(pickedFile!.path!);
    final ref = FirebaseStorage.instance.ref().child(path);
    upload1 = ref.putFile(file);
    final snapshot = await upload1!.whenComplete(() {});
    final urldowload1 = await snapshot.ref.getDownloadURL();

    setState(() {
      url1 = urldowload1;
    });
  }

  Future uploadFile2() async {
    final path1 = 'filemovil/${picked!.name}';
    final file1 = File(picked!.path!);
    final refe = FirebaseStorage.instance.ref().child(path1);
    upload2 = refe.putFile(file1);
    final snapsh = await upload2!.whenComplete(() {});
    final urldowload2 = await snapsh.ref.getDownloadURL();

    setState(() {
      url2 = urldowload2;
    });
  }

  Widget textbox(String description, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, top: 15),
      child: TextFormField(
        enabled: checkestado,
        onChanged: (value) {
          setState(() {
            _isButtonDisabled = true;
          });
        },
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

  Widget textbox1(String description, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, top: 15),
      child: TextFormField(
        enabled: false,
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

  Future<void> update(int id) async {
    final response =
        await http.put(Uri.parse("$backend/api/auth/solicitud/$id"),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(<String, String>{
              "centro": namecentro.text,
              "direccion": direccion.text,
              "departamento": departamento.text,
              "provincia": provincia.text,
              "distrito": distrito.text,
              "supnombre": namesupervisor.text,
              "supcorreo": correosupervisor.text,
              "suptelefono": telefonosupervisor.text,
              "remnombre": namedirector.text,
              "remcargo": correodirector.text,
              "remcorreo": telefonodirector.text,
            }));

    setState(() {
      _isButtonDisabled = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(1, 71, 118, 1),
        title: Text("Solicitud Actual"),
      ),
      body: Container(
          padding: EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(children: <Widget>[
              Row(children: [
                Container(
                    width: 150,
                    height: 150,
                    child: Icon(
                      Icons.dashboard_customize_outlined,
                      size: 150,
                    )),
                Column(
                  children: [
                    titlebox("${soli[0]["nombre_solestado"]}"),
                    titlebox("Feha Registro: $fecharegistra"),
                    titlebox("Feha Inicio: $fechainicio")
                  ],
                )
              ]),
              titlebox("Obsebaciones de la Solicitud"),
              textbox1("Obserbaciones", observacion),
              Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: _isButtonDisabled
                            ? () => {update(soli[0]["id_solicitud"])}
                            : null,
                        icon: Icon(Icons.save)),
                    IconButton(
                        onPressed: estado >= 4
                            ? () => {
                                  showMaterialModalBottomSheet(
                                    context: context,
                                    builder: (context) => SingleChildScrollView(
                                      controller:
                                          ModalScrollController.of(context),
                                      child: Container(
                                        height: 200,
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  ElevatedButton(
                                                    onPressed: () async {
                                                      if (url1 == null ||
                                                          url1 == "") {
                                                        url1 = "";
                                                      }
                                                      final Uri url =
                                                          Uri.parse(url1);
                                                      if (!await launchUrl(
                                                        url,
                                                        mode: LaunchMode
                                                            .externalApplication,
                                                      )) {
                                                        throw 'Could not launch $url';
                                                      }
                                                    },
                                                    child: const Text(
                                                        'Constancia de Horas'),
                                                    style: ButtonStyle(
                                                      shape:
                                                          MaterialStateProperty
                                                              .all(
                                                        RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(30),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  IconButton(
                                                      onPressed: estado == 4
                                                          ? () => {selectFile()}
                                                          : null,
                                                      icon: Icon(Icons.upload)),
                                                  IconButton(
                                                      onPressed: estado == 5
                                                          ? () => {selectFile()}
                                                          : null,
                                                      icon: Icon(Icons.edit))
                                                ],
                                              ),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  ElevatedButton(
                                                    onPressed: () async {
                                                      if (url2 == null ||
                                                          url2 == "") {
                                                        url2 = "";
                                                      }
                                                      final Uri url =
                                                          Uri.parse(url2);
                                                      if (!await launchUrl(
                                                        url,
                                                        mode: LaunchMode
                                                            .externalApplication,
                                                      )) {
                                                        throw 'Could not launch $url';
                                                      }
                                                    },
                                                    child: const Text(
                                                        'Informe de Practicas'),
                                                    style: ButtonStyle(
                                                      shape:
                                                          MaterialStateProperty
                                                              .all(
                                                        RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(30),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  IconButton(
                                                      onPressed: estado == 4
                                                          ? () =>
                                                              {selectFile1()}
                                                          : null,
                                                      icon: Icon(Icons.upload)),
                                                  IconButton(
                                                      onPressed: estado == 5
                                                          ? () =>
                                                              {selectFile1()}
                                                          : null,
                                                      icon: Icon(Icons.edit))
                                                ],
                                              ),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  ElevatedButton(
                                                    onPressed: estado == 4
                                                        ? () => {
                                                              if (picked ==
                                                                      null ||
                                                                  pickedFile ==
                                                                      null)
                                                                {
                                                                  showDialog<
                                                                      String>(
                                                                    context:
                                                                        context,
                                                                    builder: (BuildContext
                                                                            context) =>
                                                                        AlertDialog(
                                                                      title: const Text(
                                                                          'Porfavor seleccione documentos para subir'),
                                                                      content:
                                                                          const Text(
                                                                              ''),
                                                                      actions: <
                                                                          Widget>[
                                                                        TextButton(
                                                                          onPressed: () => Navigator.pop(
                                                                              context,
                                                                              'OK'),
                                                                          child:
                                                                              const Text('OK'),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                }
                                                              else
                                                                {
                                                                  uploadFile()
                                                                      .then(
                                                                          (value) {
                                                                    registrar()
                                                                        .then(
                                                                            (value) {
                                                                      Navigator.pop(
                                                                          context);
                                                                      Navigator.pop(
                                                                          context);
                                                                    });
                                                                  })
                                                                }
                                                            }
                                                        : null,
                                                    child:
                                                        const Text('Guardar'),
                                                    style: ButtonStyle(
                                                      shape:
                                                          MaterialStateProperty
                                                              .all(
                                                        RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(30),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 10,
                                                  ),
                                                  ElevatedButton(
                                                    onPressed: estado == 5
                                                        ? () => {
                                                              if (picked ==
                                                                      null &&
                                                                  pickedFile ==
                                                                      null)
                                                                {
                                                                  showDialog<
                                                                      String>(
                                                                    context:
                                                                        context,
                                                                    builder: (BuildContext
                                                                            context) =>
                                                                        AlertDialog(
                                                                      title: const Text(
                                                                          'Porfavor al menos un documento para subir'),
                                                                      content:
                                                                          const Text(
                                                                              ''),
                                                                      actions: <
                                                                          Widget>[
                                                                        TextButton(
                                                                          onPressed: () => Navigator.pop(
                                                                              context,
                                                                              'OK'),
                                                                          child:
                                                                              const Text('OK'),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                }
                                                              else
                                                                {
                                                                  if (picked !=
                                                                          null &&
                                                                      pickedFile !=
                                                                          null)
                                                                    {
                                                                      uploadFile()
                                                                          .then(
                                                                              (value) {
                                                                        actualizar()
                                                                            .then((value) {
                                                                          pickedFile =
                                                                              null;
                                                                          picked =
                                                                              null;
                                                                          Navigator.pop(
                                                                              context);
                                                                        });
                                                                      })
                                                                    }
                                                                  else if (picked !=
                                                                      null)
                                                                    {
                                                                      print(
                                                                          "2"),
                                                                      uploadFile2()
                                                                          .then(
                                                                              (value) {
                                                                        actualizar()
                                                                            .then((value) {
                                                                          picked =
                                                                              null;
                                                                          Navigator.pop(
                                                                              context);
                                                                        });
                                                                      })
                                                                    }
                                                                  else if (pickedFile !=
                                                                      null)
                                                                    {
                                                                      print(
                                                                          "1"),
                                                                      uploadFile1()
                                                                          .then(
                                                                              (value) {
                                                                        actualizar()
                                                                            .then((value) {
                                                                          pickedFile =
                                                                              null;
                                                                          Navigator.pop(
                                                                              context);
                                                                        });
                                                                      })
                                                                    }
                                                                }
                                                            }
                                                        : null,
                                                    child: const Text('Editar'),
                                                    style: ButtonStyle(
                                                      shape:
                                                          MaterialStateProperty
                                                              .all(
                                                        RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(30),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ]),
                                      ),
                                    ),
                                  )
                                }
                            : null,
                        icon: Icon(Icons.upload)),
                    IconButton(
                        onPressed: checkestado
                            ? () => {
                                  deletesolicitud(soli[0]["id_solicitud"],
                                          soli[0]["id_postulante"])
                                      .then((value) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Homepage(
                                                validacion: 0,
                                              )),
                                    );
                                  })
                                }
                            : null,
                        icon: Icon(Icons.delete))
                  ],
                ),
              ),
              titlebox("Centro de Practicas"),
              textbox("Nombre", namecentro),
              textbox("Departamento", departamento),
              textbox("Provincia", provincia),
              textbox("Distrito", distrito),
              textbox("Direccion", direccion),
              titlebox("Supervisor"),
              textbox("Nombre", namesupervisor),
              textbox("Correo", correosupervisor),
              textbox("Telefono", telefonosupervisor),
              titlebox("Director"),
              textbox("Nombre", namedirector),
              textbox("Cargo", correodirector),
              textbox("Telefono", telefonodirector),
            ]),
          )),
    );
  }
}
