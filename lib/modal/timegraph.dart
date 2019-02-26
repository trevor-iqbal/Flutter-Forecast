import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class TimeSeriesChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  TimeSeriesChart(this.seriesList, {this.animate});
  // factory TimeSeriesChart.withSampleData() {
  //   return TimeSeriesChart(
  //     _getForecastData(),
  //     animate: false,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return charts.TimeSeriesChart(
      seriesList,
      animate: animate,
      dateTimeFactory: const charts.LocalDateTimeFactory(),
    );
  }
}
class TimeSeriesTemperature {
  final DateTime time;
  final int temperature;
  TimeSeriesTemperature(this.time, this.temperature);
}