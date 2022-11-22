import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:movil_proyecto/Screens/reportes/reportescomunitarias.dart';
import 'package:movil_proyecto/Screens/reportes/reportesclinicas.dart';

void main() => runApp(const reportesPage());

class reportesPage extends StatefulWidget {
  const reportesPage({super.key});

  @override
  State<reportesPage> createState() => _reportesPageState();
}

class _reportesPageState extends State<reportesPage> {
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

  late List<_ChartData> data;
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    data = [
      _ChartData('Horas Hechas', 200),
      _ChartData('Horas Restantes', 150),
    ];
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final List<sChartData> chartData = [
    //   sChartData('David', 25, Colors.black),
    //   sChartData('Steve', 38, Colors.green),
    //   sChartData('Jack', 34, Colors.red),
    //   sChartData('Others', 52, Colors.blue)
    // ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            titlebox("TOTAL PRÁCTICAS: 700 hrs"),

            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Total Horas Practicas Comunitarias: 350",
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text(
                        "Horas Validadas: 200",
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: <Widget>[
                    Text(
                      "Total Horas Practicas Clínicas: 350",
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text(
                        "Horas Validadas: 150",
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 15.0,
                      width: 15.0,
                      color: Color.fromARGB(255, 190, 98, 103),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Text(
                        "Prácticas Comunitarias",
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Container(
                        height: 15.0,
                        width: 15.0,
                        color: Color.fromARGB(255, 68, 117, 173),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Text(
                        "Prácticas Clínicas",
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
              ),
            ),
            SfCircularChart(
              series: <CircularSeries>[
                RadialBarSeries<_ChartData, String>(
                  dataSource: data,
                  xValueMapper: (_ChartData data, _) => data.x,
                  yValueMapper: (_ChartData data, _) => data.y,
                )
              ],
            ),
            titlebox("PRÁCTICAS EN CURSO: PRÁCTICAS COMUNITARIAS"),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 15.0,
                      width: 15.0,
                      color: Color.fromARGB(255, 190, 98, 103),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Text(
                        "Prácticas Restantes",
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Container(
                        height: 15.0,
                        width: 15.0,
                        color: Color.fromARGB(255, 68, 117, 173),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Text(
                        "Prácticas Hechas",
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
              ),
            ),
            SfCircularChart(
              tooltipBehavior: _tooltip,
              series: <CircularSeries<_ChartData, String>>[
                DoughnutSeries<_ChartData, String>(
                    dataSource: data,
                    xValueMapper: (_ChartData data, _) => data.x,
                    yValueMapper: (_ChartData data, _) => data.y,
                    name: 'Practicas Comunitarias')
              ],
            ),
            // SfCircularChart(series: <CircularSeries>[
            //   // Render pie chart
            //   PieSeries<ChartData, String>(
            //       dataSource: chartData,
            //       pointColorMapper: (ChartData data, _) => data.color,
            //       xValueMapper: (ChartData data, _) => data.x,
            //       yValueMapper: (ChartData data, _) => data.y)
            // ])
          ],
        ),
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);

  final String x;
  final num y;
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final num y;
}

// class sChartData {
//   sChartData(this.x, this.y, this.color);
//   final String x;
//   final double y;
//   final Color color;
// }
