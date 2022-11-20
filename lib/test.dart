import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:fancy_containers/fancy_containers.dart';
import 'package:http/http.dart' as http;

import 'HttpClass.dart';
import 'PostModel.dart';

class LineChartSample2 extends StatefulWidget {
  const LineChartSample2({super.key});

  @override
  State<LineChartSample2> createState() => _LineChartSample2State();
}

class _LineChartSample2State extends State<LineChartSample2> {
  List<Color> gradientColors = [
    const Color(0xff02d39a),
    const Color(0xfff5cb5c),
  ];

  int stress_level = 0;
  int vacantion_needed = 0;

  bool showAvg = false;
  double value = 5.0;

  Future getRequestAsync() async {
    HttpService service = HttpService();

    StressLevel? res = await service.getRequest<StressLevel>();
    stress_level = res!.stress_level;

    VacantionNeeded? res2 = await service.getRequest<VacantionNeeded>();
    vacantion_needed = res2!.take_vacantion;
  }

  @override
  void initState(){
    super.initState();
    getRequestAsync();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Column(children: [
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
              padding: EdgeInsets.only(left: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Your Status",
                    style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )
          ]),
        ],
      ),
      SizedBox(height: height * 0.05),
      Stack(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 1.70,
            child: DecoratedBox(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(18),
                ),
                color: Color(0xffc0c0c0),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 18,
                  left: 12,
                  top: 24,
                  bottom: 12,
                ),
                child: LineChart(
                  showAvg ? avgData() : mainData(),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 60,
            height: 34,
            child: TextButton(
              onPressed: () {
                setState(() {
                  showAvg = !showAvg;
                });
              },
              child: Text(
                'avg',
                style: TextStyle(
                  fontSize: 12,
                  color: showAvg ? Colors.white.withOpacity(0.5) : Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
        child: Container(
          padding: const EdgeInsets.fromLTRB(5, 20, 5, 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            gradient: LinearGradient(
                colors:[Colors.lightGreen, Colors.yellowAccent, Colors.red],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 12,
                offset: Offset(0, 6),
              ),
            ],
          ),
          child: Text(
            'How stressed are you today?',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ),
      SliderTheme(
        data: SliderTheme.of(context).copyWith(
          trackHeight: 10.0,
          trackShape: RoundedRectSliderTrackShape(),
          activeTrackColor: Colors.blue.shade800,
          inactiveTrackColor: Colors.blue.shade100,
          thumbShape: RoundSliderThumbShape(
            enabledThumbRadius: 14.0,
            pressedElevation: 8.0,
          ),
          thumbColor: Colors.yellowAccent,
          overlayColor: Colors.yellow.withOpacity(0.2),
          overlayShape: RoundSliderOverlayShape(overlayRadius: 32.0),
          tickMarkShape: RoundSliderTickMarkShape(),
          activeTickMarkColor: Colors.yellowAccent,
          inactiveTickMarkColor: Colors.white,
          valueIndicatorShape: PaddleSliderValueIndicatorShape(),
          valueIndicatorColor: Colors.black,
          valueIndicatorTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
        child: Slider(
          min: 1.0,
          max: 10.0,
          value: value,
          divisions: 9,
          label: '${value.round()}',
          onChanged: (_value) {
            setState(() {
              value = _value;
            });
          },
        ),
      ),
      StressLevelWidget()
    ]);
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff68737d),
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text('14/11', style: style);
        break;
      case 1:
        text = const Text('15/11', style: style);
        break;
      case 2:
        text = const Text('16/11', style: style);
        break;
      case 3:
        text = const Text('17/11', style: style);
        break;
      case 4:
        text = const Text('18/11', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget StressLevelWidget() {
    String title = '';
    Color color = Colors.white;

    if (vacantion_needed == 1) {
      title = "You should talk a day off";
      color = Colors.red;
    } else if (stress_level <= 1) {
      title = "Nothing to worry about";
      color = Colors.green;
    } else if (stress_level >= 2 && stress_level <= 3) {
      title = "Moderate level of stress";
      color = Colors.yellow;
    } else if (stress_level == 4) {
      title = "Maximum stress percentage";
      color = Colors.deepOrange;
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Container(
        padding: const EdgeInsets.fromLTRB(5, 20, 5, 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          gradient: LinearGradient(
              colors:[color, color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 12,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff67727d),
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
    String text = value.toInt().toString();

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: 4,
      minY: 0,
      maxY: 11,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 9),
            FlSpot(1, 9.2),
            FlSpot(2, 8),
            FlSpot(3, 7.2),
            FlSpot(4, 6.5),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }

  LineChartData avgData() {
    return LineChartData(
      lineTouchData: LineTouchData(enabled: false),
      gridData: FlGridData(
        show: true,
        drawHorizontalLine: true,
        verticalInterval: 1,
        horizontalInterval: 1,
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: bottomTitleWidgets,
            interval: 1,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
            interval: 1,
          ),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: 4,
      minY: 50,
      maxY: 110,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 85),
            FlSpot(1, 84),
            FlSpot(2, 83),
            FlSpot(3, 84),
            FlSpot(4, 82),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: [
              ColorTween(begin: gradientColors[0], end: gradientColors[1])
                  .lerp(0.2)!,
              ColorTween(begin: gradientColors[0], end: gradientColors[1])
                  .lerp(0.2)!,
            ],
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: [
                ColorTween(begin: gradientColors[0], end: gradientColors[1])
                    .lerp(0.2)!
                    .withOpacity(0.1),
                ColorTween(begin: gradientColors[0], end: gradientColors[1])
                    .lerp(0.2)!
                    .withOpacity(0.1),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
