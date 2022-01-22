// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k_car_care_project/helpers/chart_counter_helper.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartFlutter extends StatefulWidget {
  final int count;
  const ChartFlutter({
    Key? key,
    required this.count,
  }) : super(key: key);

  @override
  _ChartFlutterState createState() => _ChartFlutterState();
}

class _ChartFlutterState extends State<ChartFlutter> {
  var counter = Get.put(CounterHelper());
  List<CounterData>? _chartData;
  TooltipBehavior? _tooltipBehavior;
  List<CounterData> getChartData() {
    final List<CounterData> chartData = [
      CounterData(title: 'Financial expense', count: widget.count),
      CounterData(title: 'Investments', count: 3),
    ];
    return chartData;
  }

  @override
  initState() {
    _tooltipBehavior = TooltipBehavior(enable: true);
    _chartData = getChartData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
      enableMultiSelection: true,
      // ignore: prefer_const_literals_to_create_immutables
      palette:  [
        Color(0xff313FA0),
        Color(0xffFF4181),
      ],
      title: ChartTitle(
        text: 'KHR 450,000.00',
        alignment: ChartAlignment.near,
        textStyle: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 16,
          color: Colors.black,
        ),
      ),
      legend: Legend(
        isResponsive: true,
        position: LegendPosition.bottom,
        isVisible: true,
        overflowMode: LegendItemOverflowMode.scroll,
      ),
      tooltipBehavior: _tooltipBehavior,
      series: <CircularSeries>[
        DoughnutSeries<CounterData, String>(
          radius: "100",
          strokeColor: Colors.black,
          dataSource: _chartData,
          xValueMapper: (CounterData data, _) => data.title,
          yValueMapper: (CounterData data, _) => data.count,
          dataLabelSettings: const DataLabelSettings(
            isVisible: true,
          ),
          enableTooltip: true,
        ),
      ],
    );
  }
}

class CounterData {
  final String title;
  final int count;
  CounterData({
    required this.title,
    required this.count,
  });
}
