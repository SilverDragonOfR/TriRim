import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {

  List time = [];
  List rain_sum = [];
  List points = [];

  Chart({required this.rain_sum});

  @override
  Widget build(BuildContext context) {
    for(int i=0;i<rain_sum.length;i++) {
      points.add([rain_sum.length-i-1,rain_sum[i]]);
    }

    return AspectRatio(
      aspectRatio: 1.3,
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: LineChart(
          LineChartData(
            maxX: 1900,
            maxY: 200,
            backgroundColor: Colors.black87,
            lineBarsData: [
              LineChartBarData(
                isCurved: true,
                curveSmoothness: 0,
                preventCurveOverShooting: true,
                dotData: FlDotData(show: false),
                color: Colors.blue,
                barWidth: 2,
                belowBarData: BarAreaData(
                  show: true,
                  color: Colors.blue.withOpacity(0.7)
                ),
                spots: points.map((point) => FlSpot(point[0], point[1])).toList()
              )
            ],
            titlesData: const FlTitlesData(
              show: true,
              bottomTitles: AxisTitles(
                axisNameWidget: Text("Days ago"),
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 40,
                  interval: 150
                ),
              ),
              leftTitles: AxisTitles(
                axisNameWidget: Text("Rainfall (in mm)"),
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 40,
                    interval: 20
                )
              ),
              topTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: false
                )
              ),
              rightTitles: AxisTitles(
                  sideTitles: SideTitles(
                      showTitles: false
                  )
              ),
            ),
            gridData: FlGridData(
              show: false,
            )
          )
        ),
      ),
    );
  }
}
