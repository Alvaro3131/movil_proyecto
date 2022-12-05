import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:movil_proyecto/Screens/revisarsolicitud/web_view.dart';
import 'package:url_launcher/url_launcher.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  PlatformFile? pickedFile;
  PlatformFile? picked;
  UploadTask? upload1;
  UploadTask? upload2;
  String url1 = "";
  String url2 = "";
  var _isButtonDisabled = false;
  int estado = 5;
  TextEditingController namecentro = TextEditingController();
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

  bool() {
    if (estado <= 3) {
      return false;
    } else {
      return true;
    }
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

  Widget textbox(String description, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, top: 15),
      child: TextFormField(
        enabled: bool(),
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
                    titlebox("Estado: Registrado"),
                    titlebox("Feha Registro: 20/05/2021"),
                    titlebox("Feha Inicio: 20/05/2021")
                  ],
                )
              ]),
              titlebox("Obsebaciones de la Solicitud"),
              textbox1("Obserbaciones", namecentro),
              Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed:
                            _isButtonDisabled ? () => {print("object")} : null,
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
                                                        ? () => {uploadFile()}
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
                                                        ? () => {uploadFile()}
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
                    IconButton(onPressed: () {}, icon: Icon(Icons.delete))
                  ],
                ),
              ),
              titlebox("Centro de Practicas"),
              textbox("Nombre", namecentro),
              textbox("Departamento", namecentro),
              textbox("Provincia", namecentro),
              textbox("Distrito", namecentro),
              textbox("Direccion", namecentro),
              titlebox("Supervisor"),
              textbox("Nombre", namecentro),
              textbox("Correo", namecentro),
              textbox("Telefono", namecentro),
              titlebox("Director"),
              textbox("Nombre", namecentro),
              textbox("Cargo", namecentro),
              textbox("Telefono", namecentro),
            ]),
          )),
    );
  }
}
