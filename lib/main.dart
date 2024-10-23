import 'package:flutter/material.dart';
import 'package:graficos_metodos_de_ordenacao/chart_component.dart';
import 'package:graficos_metodos_de_ordenacao/model/chart_data_column_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gráficos',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 40, 219, 195)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Gráficos de ordenação'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<ChartDataColumnModel> chartData1000 = [
    ChartDataColumnModel(duration: const Duration(milliseconds: 015), method: 'Bubble'),
    ChartDataColumnModel(duration: const Duration(milliseconds: 004), method: 'Inserção'),
    ChartDataColumnModel(duration: const Duration(milliseconds: 002), method: 'Seleção'),
    ChartDataColumnModel(duration: const Duration(milliseconds: 001), method: 'Contagem'),
    ChartDataColumnModel(duration: const Duration(milliseconds: 001), method: 'Shell'),
    ChartDataColumnModel(duration: const Duration(milliseconds: 003), method: 'Quicksort'),
  ];

  List<ChartDataColumnModel> chartData100m = [
    ChartDataColumnModel(duration: const Duration(minutes: 2, seconds: 37, milliseconds: 579), method: 'Bubble'),
    ChartDataColumnModel(duration: const Duration(seconds: 39, milliseconds: 196), method: 'Inserção'),
    ChartDataColumnModel(duration: const Duration(seconds: 26, milliseconds: 629), method: 'Seleção'),
    ChartDataColumnModel(duration: const Duration(milliseconds: 011), method: 'Contagem'),
    ChartDataColumnModel(duration: const Duration(milliseconds: 073), method: 'Shell'),
    ChartDataColumnModel(duration: const Duration(seconds: 32, milliseconds: 196), method: 'Quicksort'),
  ];
  List<ChartDataColumnModel> chartData100mm = [
    ChartDataColumnModel(duration: const Duration(hours: 4, minutes: 22, seconds: 48), method: 'Bubble'),
    ChartDataColumnModel(duration: const Duration(hours: 1, minutes: 27, seconds: 40, milliseconds: 189), method: 'Inserção'),
    ChartDataColumnModel(duration: const Duration(minutes: 44, seconds: 23, milliseconds: 873), method: 'Seleção'),
    ChartDataColumnModel(duration: const Duration(milliseconds: 132), method: 'Contagem'),
    ChartDataColumnModel(duration: const Duration(seconds: 1, milliseconds: 063), method: 'Shell'),
    ChartDataColumnModel(duration: const Duration(minutes: 53, seconds: 10, milliseconds: 019), method: 'Quicksort'),
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 15),
            MyChart(
              title: '1000 índices',
              series: <ColumnSeries<ChartDataColumnModel, String>>[
                ColumnSeries<ChartDataColumnModel, String>(
                  animationDuration: 2000,
                  dataSource: chartData1000,
                  color: Colors.green,
                  dataLabelSettings: const DataLabelSettings(
                    isVisible: false,
                    textStyle: TextStyle(color: Colors.green),
                    angle: -20,
                    showZeroValue: false,
                  ),
                  xValueMapper: (ChartDataColumnModel x, _) => x.method,
                  yValueMapper: (ChartDataColumnModel y, _) => y.duration.inMilliseconds,
                ),
              ],
              format: 'point.y milissegundos',
            ),
            const SizedBox(height: 15),
            MyChart(
              title: '100.000 índices',
              series: <ColumnSeries<ChartDataColumnModel, String>>[
                ColumnSeries<ChartDataColumnModel, String>(
                  animationDuration: 2000,
                  dataSource: chartData100m,
                  color: Colors.purple,
                  dataLabelSettings: const DataLabelSettings(
                    isVisible: false,
                    textStyle: TextStyle(color: Colors.purple),
                    angle: -20,
                    showZeroValue: false,
                  ),
                  xValueMapper: (ChartDataColumnModel x, _) => x.method,
                  yValueMapper: (ChartDataColumnModel y, _) => y.duration.inSeconds,
                ),
              ],
              format: 'point.y segundos',
            ),
            const SizedBox(height: 15),
            MyChart(
              title: '1.000.000 índices',
              series: <ColumnSeries<ChartDataColumnModel, String>>[
                ColumnSeries<ChartDataColumnModel, String>(
                  animationDuration: 2000,
                  dataSource: chartData100mm,
                  color: Colors.redAccent,
                  dataLabelSettings: const DataLabelSettings(
                    isVisible: false,
                    textStyle: TextStyle(color: Colors.redAccent),
                    angle: -20,
                    showZeroValue: false,
                  ),
                  xValueMapper: (ChartDataColumnModel x, _) => x.method,
                  yValueMapper: (ChartDataColumnModel y, _) => y.duration.inSeconds,
                ),
              ],
              format: 'point.y segundos',
            ),
          ],
        ),
      ),
    );
  }
}
