import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;


class TimeSeriesChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  TimeSeriesChart(this.seriesList, {this.animate});

  @override
  Widget build(BuildContext context) {
    return charts.TimeSeriesChart(
      seriesList,
      animate: animate,
      dateTimeFactory: const charts.LocalDateTimeFactory(),
       domainAxis: charts.DateTimeAxisSpec(
            renderSpec: charts.GridlineRendererSpec(
              axisLineStyle: charts.LineStyleSpec(
                color: charts.MaterialPalette.white, // this also doesn't change the Y axis labels
              ),
              labelStyle: charts.TextStyleSpec(
                fontSize: 12,
                color: charts.MaterialPalette.white,
              )
            ),
            tickFormatterSpec: charts.AutoDateTimeTickFormatterSpec(
              hour: charts.TimeFormatterSpec(
                  format: 'hh',
                  transitionFormat: 'jm',
              ))),
       primaryMeasureAxis: charts.NumericAxisSpec(
            renderSpec: charts.GridlineRendererSpec(
                labelStyle: charts.TextStyleSpec(
                    fontSize: 12, color: charts.MaterialPalette.white),
                lineStyle: charts.LineStyleSpec(
                    thickness: 1,
                    color: charts.MaterialPalette.white))),
    );
  }
}
class TimeSeriesTemperature {
  final DateTime time;
  final double temperature;
  TimeSeriesTemperature(this.time, this.temperature);
}