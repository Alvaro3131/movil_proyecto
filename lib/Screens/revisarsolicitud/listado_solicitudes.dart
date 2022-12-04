import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:movil_proyecto/Screens/revisarsolicitud/web_view.dart';
import 'package:movil_proyecto/models/country.dart';

class list_solicitud extends StatelessWidget {
  final int id;
  String text = 'asas';
  final List<Map<String, dynamic>> map;
  list_solicitud({required this.id, required this.map});

  @override
  Widget build(BuildContext context) {
    switch (id) {
      case 1:
        {
          text = 'Listado de Practicas Comunitarias';
        }
        break;
      case 2:
        {
          text = 'Listado de Practicas Clinicas';
        }
        break;
    }
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(1, 71, 118, 1),
          title: Text(text),
        ),
        body: Container(
            child: DataTable2(
          columns: [
            DataColumn2(
              label: Text('#'),
              size: ColumnSize.S,
            ),
            DataColumn(label: Text('Registro')),
            DataColumn(label: Text('Estado')),
            DataColumn(label: Center(child: Text('ACCIONES')))
          ],
          horizontalMargin: 15,
          columnSpacing: 5,
          rows: map
              .map((value) => DataRow(cells: [
                    DataCell(
                      Text(map.indexOf(value).toString()),
                    ),
                    DataCell(Text(DateFormat.yMd()
                        .format(DateTime.parse(value["fecha_reg"])))),
                    DataCell(Text(value["nombre_solestado"].toString())),
                    DataCell(Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.remove_red_eye),
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    scrollable: true,
                                    content: Padding(
                                      padding: const EdgeInsets.all(1.0),
                                      child: Form(
                                        child: Column(
                                          children: <Widget>[
                                            Text("Datos del Centro"),
                                            TextFormField(
                                              decoration: InputDecoration(
                                                enabled: false,
                                                hintText:
                                                    value["centro_practicas"],
                                                icon: Icon(Icons
                                                    .account_balance_rounded),
                                              ),
                                            ),
                                            TextFormField(
                                              decoration: InputDecoration(
                                                enabled: false,
                                                hintStyle:
                                                    TextStyle(fontSize: 10),
                                                hintText:
                                                    value["departamento"] +
                                                        ", " +
                                                        value["provincia"] +
                                                        ", " +
                                                        value["distrito"] +
                                                        ", " +
                                                        value["direccion"],
                                                icon: Icon(
                                                    Icons.add_location_rounded),
                                              ),
                                            ),
                                            Container(
                                                margin:
                                                    EdgeInsets.only(top: 20),
                                                child: Text(
                                                  "Datos Supervisor",
                                                )),
                                            TextFormField(
                                              decoration: InputDecoration(
                                                enabled: false,
                                                hintText: value["sup_nombre"],
                                                icon: Icon(Icons.account_box),
                                              ),
                                            ),
                                            TextFormField(
                                              decoration: InputDecoration(
                                                enabled: false,
                                                hintText: value["sup_correo"],
                                                icon: Icon(Icons.email),
                                              ),
                                            ),
                                            TextFormField(
                                              decoration: InputDecoration(
                                                enabled: false,
                                                hintText: value["sup_telefono"],
                                                icon: Icon(Icons.phone),
                                              ),
                                            ),
                                            Container(
                                                margin:
                                                    EdgeInsets.only(top: 20),
                                                child: Text(
                                                  "Datos Director",
                                                )),
                                            TextFormField(
                                              decoration: InputDecoration(
                                                enabled: false,
                                                hintText: value["rem_nombre"],
                                                icon: Icon(Icons.account_box),
                                              ),
                                            ),
                                            TextFormField(
                                              decoration: InputDecoration(
                                                enabled: false,
                                                hintText: value["rem_cargo"],
                                                icon: Icon(Icons.phone),
                                              ),
                                            ),
                                            TextFormField(
                                              decoration: InputDecoration(
                                                enabled: false,
                                                hintText: value["rem_correo"],
                                                icon: Icon(Icons.add_comment),
                                              ),
                                            ),
                                            Container(
                                                margin:
                                                    EdgeInsets.only(top: 20),
                                                child: Text(
                                                  "Fecha de la Solicitud",
                                                )),
                                            TextFormField(
                                              decoration: InputDecoration(
                                                enabled: false,
                                                hintText: value["fecha_inicio"],
                                                icon: Icon(
                                                    Icons.date_range_outlined),
                                              ),
                                            ),
                                            TextFormField(
                                              decoration: InputDecoration(
                                                enabled: false,
                                                hintText: value["fecha_fin"],
                                                icon: Icon(
                                                    Icons.date_range_outlined),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    actions: [
                                      ElevatedButton(
                                          child: Text("Close"),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          })
                                    ],
                                  );
                                });
                          },
                        ),
                        Flexible(
                          child: IconButton(
                            icon: Icon(Icons.article_rounded),
                            onPressed: () {
                              showMaterialModalBottomSheet(
                                context: context,
                                builder: (context) => Container(
                                  height: 300,
                                  child: Column(children: [
                                    Container(
                                      child: ElevatedButton.icon(
                                        icon: Icon(Icons.picture_as_pdf),
                                        style: ElevatedButton.styleFrom(
                                            fixedSize: const Size(240, 20),
                                            backgroundColor:
                                                Color.fromRGBO(1, 71, 118, 1),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                            )),
                                        onPressed: () {
                                          if (value["INFO"] == null) {
                                            value["INFO"] = "null";
                                          }
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (BuildContext
                                                          context) =>
                                                      WebViewpage(
                                                          title:
                                                              "Carta de Presentacion",
                                                          url: value[
                                                              "link_carta"])));
                                        },
                                        label: Text(
                                          "Carta de Presentacion",
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    ElevatedButton.icon(
                                      icon: Icon(Icons.picture_as_pdf),
                                      style: ElevatedButton.styleFrom(
                                          fixedSize: const Size(240, 20),
                                          backgroundColor:
                                              Color.fromRGBO(1, 71, 118, 1),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          )),
                                      onPressed: () {
                                        if (value["link_guiapracticas"] ==
                                            null) {
                                          value["link_guiapracticas"] = "null";
                                        }
                                        Navigator.of(context).push(MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                WebViewpage(
                                                    title:
                                                        "Guia de Practicas Inicio",
                                                    url: value[
                                                        "link_guiapracticas"])));
                                      },
                                      label: Text(
                                        "Guia de Practicas Inicio",
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    ElevatedButton.icon(
                                      icon: Icon(Icons.picture_as_pdf),
                                      style: ElevatedButton.styleFrom(
                                          fixedSize: const Size(240, 20),
                                          backgroundColor:
                                              Color.fromRGBO(1, 71, 118, 1),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          )),
                                      onPressed: () {
                                        if (value["INFO"] == null) {
                                          value["INFO"] = "null";
                                        }
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (BuildContext
                                                        context) =>
                                                    WebViewpage(
                                                        title:
                                                            "Informe de Practicas",
                                                        url: value["INFO"])));
                                      },
                                      label: Text(
                                        "Informe de Practicas",
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    ElevatedButton.icon(
                                      icon: Icon(Icons.picture_as_pdf),
                                      style: ElevatedButton.styleFrom(
                                          fixedSize: const Size(240, 20),
                                          backgroundColor:
                                              Color.fromRGBO(1, 71, 118, 1),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          )),
                                      onPressed: () {
                                        if (value["CONSTANCIAHORAS"] == null) {
                                          value["CONSTANCIAHORAS"] = "null";
                                        }
                                        Navigator.of(context).push(MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                WebViewpage(
                                                    title:
                                                        "Constancias de Horas",
                                                    url: value[
                                                        "CONSTANCIAHORAS"])));
                                      },
                                      label: Text(
                                        "Constancias de Horas",
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    ElevatedButton.icon(
                                      icon: Icon(Icons.picture_as_pdf),
                                      style: ElevatedButton.styleFrom(
                                          fixedSize: const Size(240, 20),
                                          backgroundColor:
                                              Color.fromRGBO(1, 71, 118, 1),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          )),
                                      onPressed: () {
                                        if (value["GUIAPRACTICAS"] == null) {
                                          value["GUIAPRACTICAS"] = "null";
                                        }
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (BuildContext
                                                        context) =>
                                                    WebViewpage(
                                                        title:
                                                            "Guia de Practicas",
                                                        url: value[
                                                            "GUIAPRACTICAS"])));
                                      },
                                      label: Text(
                                        "Guia de Practicas",
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ]),
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    )),
                  ]))
              .toList(),
        )));
  }
}
