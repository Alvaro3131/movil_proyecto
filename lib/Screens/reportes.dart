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
    final List<ChartData> chartData = [
      ChartData('David', 25, Colors.black),
      ChartData('Steve', 38, Colors.green),
      ChartData('Jack', 34, Colors.red),
      ChartData('Others', 52, Colors.blue)
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            titlebox("REPORTE PRÁCTICAS COMUNITARIAS"),
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
            SfCircularChart(
              series: <CircularSeries>[
                RadialBarSeries<_ChartData, String>(
                  dataSource: data,
                  xValueMapper: (_ChartData data, _) => data.x,
                  yValueMapper: (_ChartData data, _) => data.y,
                )
              ],
            ),
            SfCircularChart(series: <CircularSeries>[
              // Render pie chart
              PieSeries<ChartData, String>(
                  dataSource: chartData,
                  pointColorMapper: (ChartData data, _) => data.color,
                  xValueMapper: (ChartData data, _) => data.x,
                  yValueMapper: (ChartData data, _) => data.y)
            ])
          ],
        ),
      ),
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final num y;
}

class ChartData {
  ChartData(this.x, this.y, this.color);
  final String x;
  final double y;
  final Color color;
}
