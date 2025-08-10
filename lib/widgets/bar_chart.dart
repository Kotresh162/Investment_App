import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
// import '../models/company_details.dart';
import 'package:intl/intl.dart';
import 'package:untitled/models/company_details.dart';

Widget buildChart(List<FinancialEntry>Details) {
  // final List<ChartData> chartData = [
  //   ChartData('J', 120000, 100000),
  //   ChartData('F', 140000, 110000),
  //   ChartData('M', 160000, 100000),
  //   ChartData('A', 180000, 160000),
  //   ChartData('M', 120000, 100000),
  //   ChartData('J1', 140000, 110000),
  //   ChartData('J2', 160000, 100000),
  //   ChartData('A', 180000, 160000),
  //   ChartData('S', 120000, 100000),
  //   ChartData('O', 140000, 110000),
  //   ChartData('N', 160000, 100000),
  //   ChartData('D', 180000, 160000),
  // ];

  return SizedBox(
    height: 194,
    width: 350,
    child: SfCartesianChart(
      primaryXAxis: CategoryAxis(
        majorTickLines: const MajorTickLines(size: 0),
        axisLine: const AxisLine(width: 0),
        labelPlacement: LabelPlacement.betweenTicks,
      ),
      primaryYAxis: NumericAxis(
        numberFormat: NumberFormat.compactCurrency(
          decimalDigits: 0,
          symbol: 'L', // adds 'L' after number
        ),
        majorTickLines: const MajorTickLines(size: 0),
        axisLine: const AxisLine(width: 0),
      ),
      series: <CartesianSeries>[
        StackedColumnSeries<FinancialEntry, String>(
          dataSource: Details,
          xValueMapper: (FinancialEntry data, _) => data.month,
          yValueMapper: (FinancialEntry data, _) => data.value,
          width: 1, // 12% of available category width
          spacing: 8.75 / (12 + 8.75), // gap between columns
        ),
        StackedColumnSeries<FinancialEntry, String>(
          dataSource: Details,
          xValueMapper: (FinancialEntry data, _) => data.month,
          yValueMapper: (FinancialEntry data, _) => 30000000,
          width: 1,
          spacing: 8.75 / (12 + 8.75),
        ),
      ],
    ),
  );
}

class ChartData {
  final String x;
  final int y1;
  final int y2;
  ChartData(this.x, this.y1, this.y2);
}
