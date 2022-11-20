import 'package:dev_hack/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:fl_chart/fl_chart.dart';

class DataPage extends StatefulWidget {
  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  List<FlSpot>? chartData;
  List<FlSpot>? chartData2;

  TrackballBehavior? _trackballBehavior;

  @override
  void initState() {
    _trackballBehavior = TrackballBehavior(
        enable: true, activationMode: ActivationMode.singleTap);
    chartData = [
      FlSpot(14.11, 90),
      FlSpot(15.11, 92),
      FlSpot(16.11, 80),
      FlSpot(17.11, 72),
      FlSpot(18.11, 65),
    ];
    chartData2 = [
      FlSpot(14.11, 85),
      FlSpot(15.11, 84),
      FlSpot(16.11, 83),
      FlSpot(17.11, 84),
      FlSpot(18.11, 82),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(children: [
                  Container(
                    height: height * 0.25,
                    child: Image.asset('assets/sfera.jpeg'),
                  ),
                  Container(
                    height: height * 0.15,
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Your Status",
                          style: TextStyle(
                              fontSize: 50,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  )
                ]),
              ],
            ),
            Container(
                height: 0.2 * height,
                child: LineChart(LineChartData(

                    borderData: FlBorderData(show: true),
                    minY: 0,
                    maxY: 100,
                    minX: 14,
                    maxX: 18,
                    lineBarsData: [
                      LineChartBarData(
                        spots: chartData,
                        isCurved: true,
                        barWidth: 3,
                        color: Colors.red,
                      ),
                      LineChartBarData(
                        spots: chartData2,
                        isCurved: true,
                        barWidth: 3,
                        color: Colors.orange,
                      ),
                    ])))
          ],
        ),
      ),
    );
  }
}

class _data {
  final String date;
  final int score;
  final int averageScore;

  _data(this.date, this.score, this.averageScore);
}
