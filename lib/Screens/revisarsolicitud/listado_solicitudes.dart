import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:movil_proyecto/Screens/revisarsolicitud/web_view.dart';
import 'package:movil_proyecto/models/country.dart';

class list_solicitud extends StatelessWidget {
  final int id;
  String text = 'asas';
  list_solicitud({required this.id});

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
              label: Text('ID'),
              size: ColumnSize.S,
            ),
            DataColumn(label: Text('Book')),
            DataColumn(label: Text('Author')),
            DataColumn(label: Center(child: Text('Category')))
          ],
          horizontalMargin: 15,
          columnSpacing: 5,
          rows: countries
              .map((book) => DataRow(cells: [
                    DataCell(
                      Text(countries.indexOf(book).toString()),
                    ),
                    DataCell(Text(book.name)),
                    DataCell(Text(book.population.toString())),
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
                                                hintText: book.name,
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
                                                    "Lima,Lima,Chaclacayo Mz A lt 14 nueva alianza",
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
                                                hintText:
                                                    "Alvaro Alonso Alva Chipana",
                                                icon: Icon(Icons.account_box),
                                              ),
                                            ),
                                            TextFormField(
                                              decoration: InputDecoration(
                                                enabled: false,
                                                hintText:
                                                    "alvaro.alvac@gmail.com",
                                                icon: Icon(Icons.email),
                                              ),
                                            ),
                                            TextFormField(
                                              decoration: InputDecoration(
                                                enabled: false,
                                                hintText: "987618614",
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
                                                hintText: "David Reyna",
                                                icon: Icon(Icons.account_box),
                                              ),
                                            ),
                                            TextFormField(
                                              decoration: InputDecoration(
                                                enabled: false,
                                                hintText: "Director",
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
                                                hintText: "11/06/2022",
                                                icon: Icon(
                                                    Icons.date_range_outlined),
                                              ),
                                            ),
                                            TextFormField(
                                              decoration: InputDecoration(
                                                enabled: false,
                                                hintText: "11/06/2022",
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
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (BuildContext
                                                        context) =>
                                                    WebViewpage(
                                                        title:
                                                            "Solciitud Carta",
                                                        url:
                                                            "https://firebasestorage.googleapis.com/v0/b/storagemunicipalidad.appspot.com/o/images%2Fimage%3A1000021367?alt=media&token=93a04c1d-ee59-412e-b784-251cac881c35")));
                                      },
                                      label: Text(
                                        "Solciitud Carta",
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
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
                                          Navigator.of(context).push(MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  WebViewpage(
                                                      title:
                                                          "Carta de Presentacion",
                                                      url:
                                                          "https://firebasestorage.googleapis.com/v0/b/storagemunicipalidad.appspot.com/o/images%2Fimage%3A1000021367?alt=media&token=93a04c1d-ee59-412e-b784-251cac881c35")));
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
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (BuildContext
                                                        context) =>
                                                    WebViewpage(
                                                        title:
                                                            "Guia de Practicas",
                                                        url:
                                                            "https://firebasestorage.googleapis.com/v0/b/storagemunicipalidad.appspot.com/o/images%2Fimage%3A1000021367?alt=media&token=93a04c1d-ee59-412e-b784-251cac881c35")));
                                      },
                                      label: Text(
                                        "Guia de Practicas",
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
                                        Navigator.of(context).push(MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                WebViewpage(
                                                    title:
                                                        "Informe de Practicas",
                                                    url:
                                                        "https://firebasestorage.googleapis.com/v0/b/storagemunicipalidad.appspot.com/o/images%2Fimage%3A1000021367?alt=media&token=93a04c1d-ee59-412e-b784-251cac881c35")));
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
                                        Navigator.of(context).push(MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                WebViewpage(
                                                    title:
                                                        "Constancias de Horas",
                                                    url:
                                                        "https://www.facebook.com")));
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
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (BuildContext
                                                        context) =>
                                                    WebViewpage(
                                                        title:
                                                            "Guia de Practicas",
                                                        url:
                                                            "https://firebasestorage.googleapis.com/v0/b/storagemunicipalidad.appspot.com/o/images%2Fimage%3A1000021367?alt=media&token=93a04c1d-ee59-412e-b784-251cac881c35")));
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
