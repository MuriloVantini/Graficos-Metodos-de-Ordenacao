import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MyChart extends StatefulWidget {
  final String title;
  final String format;
  final List<CartesianSeries<dynamic, dynamic>> series;
  const MyChart({super.key, required this.title, required this.series, required this.format});

  @override
  State<MyChart> createState() => _MyChartState();
}

class _MyChartState extends State<MyChart> {
  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      title: ChartTitle(text: widget.title),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      trackballBehavior: TrackballBehavior(
        //Legenda quando o usuário segura no gráfico
        tooltipDisplayMode: TrackballDisplayMode.groupAllPoints,
        enable: true,
        lineColor: Colors.black54,
        shouldAlwaysShow: false,
        lineWidth: 2,
        markerSettings: const TrackballMarkerSettings(shape: DataMarkerType.circle),
        tooltipAlignment: ChartAlignment.values.first,
        tooltipSettings: InteractiveTooltip(
          borderRadius: 20,
          enable: true,
          color: Colors.white,
          canShowMarker: true,
          textStyle: const TextStyle(color: Colors.black),
          format: widget.format,
        ),
      ),
      enableAxisAnimation: true,
      plotAreaBorderColor: Theme.of(context).colorScheme.secondary,
      //Eixo X
      primaryXAxis: CategoryAxis(
        autoScrollingMode: AutoScrollingMode.start,
        labelRotation: -45,
        majorGridLines: MajorGridLines(width: 0.4, color: Theme.of(context).colorScheme.secondary),
      ),

      //Eixo Y
      primaryYAxis: NumericAxis(enableAutoIntervalOnZooming: true, majorGridLines: MajorGridLines(width: 0.1, color: Theme.of(context).colorScheme.secondary)),
      series: widget.series,
    );
  }
}
