import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
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
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(1, 71, 118, 1),
          title: Text(text),
        ),
        body: Container(
            padding: EdgeInsets.all(10),
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
                            Flexible(
                              child: IconButton(
                                icon: Icon(Icons.remove_red_eye),
                                onPressed: () {
                                  showCupertinoModalBottomSheet(
                                    context: context,
                                    builder: (context) => Container(
                                      height: 500,
                                      child: SingleChildScrollView(
                                        child: Column(children: [
                                          Text("Hola Como estas"),
                                          Text("Hola Como estas"),
                                          Text("Hola Como estas"),
                                          Text("Hola Como estas"),
                                          Text("Hola Como estas"),
                                          Text("Hola Como estas"),
                                          Text("Hola Como estas"),
                                          Text("Hola Como estas"),
                                          Text("Hola Como estas")
                                        ]),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.article_rounded),
                              onPressed: () {
                                showCupertinoModalBottomSheet(
                                  context: context,
                                  builder: (context) => Container(
                                    height: 500,
                                    child: SingleChildScrollView(
                                      child: Column(children: [
                                        Text("Hola Como estas tu")
                                      ]),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        )),
                      ]))
                  .toList(),
            )));
  }

  DataTable _createDataTable() {
    return DataTable2(
      columns: _createColumns(),
      horizontalMargin: 15,
      columnSpacing: 5,
      rows: _createRows(),
    );
  }

  List<DataColumn> _createColumns() {
    return [
      DataColumn2(
        label: Text('ID'),
        size: ColumnSize.S,
      ),
      DataColumn(label: Text('Book')),
      DataColumn(label: Text('Author')),
      DataColumn(label: Center(child: Text('Category')))
    ];
  }

  List<DataRow> _createRows() {
    return countries
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
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.article_rounded),
                    onPressed: () {},
                  ),
                ],
              )),
            ]))
        .toList();
  }
}
