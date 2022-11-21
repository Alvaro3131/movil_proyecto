import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() => runApp(const reportesComunitarias());

class reportesComunitarias extends StatefulWidget {
  const reportesComunitarias({super.key});

  @override
  State<reportesComunitarias> createState() => _reportesComunitariasState();
}

class _reportesComunitariasState extends State<reportesComunitarias> {
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
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            titlebox("REPORTE PRÁCTICAS CLÍnicas"),
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
