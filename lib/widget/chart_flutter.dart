// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k_car_care_project/helpers/chart_counter_helper.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartFlutter extends StatefulWidget {
  const ChartFlutter({
    Key? key,
  }) : super(key: key);

  @override
  _ChartFlutterState createState() => _ChartFlutterState();
}

class _ChartFlutterState extends State<ChartFlutter> {
  final CounterHelper _counterHelper = Get.put(CounterHelper());
  TooltipBehavior? _tooltipBehavior;
  @override
  initState() {
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SfCircularChart(
        enableMultiSelection: true,
        // ignore: prefer_const_literals_to_create_immutables
        palette: [
          Color(0xff313FA0),
          Color(0xffFF4181),
        ],
        title: ChartTitle(
          text: _counterHelper.counter.value.toString(),
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
            dataSource: [
              CounterData(
                  title: 'Financial expense',
                  count: _counterHelper.counter.value),
            ],
            xValueMapper: (value, _) => value.title,
            yValueMapper: (CounterData data, _) => data.count,
            dataLabelSettings: const DataLabelSettings(
              isVisible: true,
            ),
            enableTooltip: true,
          ),
        ],
      ),
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
