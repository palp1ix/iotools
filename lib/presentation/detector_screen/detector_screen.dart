import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iotools/bloc/sensor/sensor_cubit.dart';
import 'package:iotools/core/theme/fonts.dart';
import 'package:iotools/data/model/detector/detector.dart';
import 'package:iotools/data/model/metrics/metrics.dart';

@RoutePage()
class DetectorScreen extends StatefulWidget {
  final Detector detector;

  const DetectorScreen({super.key, required this.detector});

  @override
  State<DetectorScreen> createState() => _DetectorScreenState();
}

class _DetectorScreenState extends State<DetectorScreen> {
  late SensorCubit sensorCubit;

  @override
  void initState() {
    sensorCubit = context.read<SensorCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocProvider(
      create: (context) => sensorCubit..loadSensorData(widget.detector),
      child: Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          backgroundColor: theme.colorScheme.surface,
        ),
        body: Column(
          children: [
            _DetectorCardLarge(detector: widget.detector),
            Expanded(
              child: BlocBuilder<SensorCubit, SensorState>(
                builder: (context, state) {
                  if (state is SensorLoading) {
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  } else if (state is SensorLoaded) {
                    return _buildSensorData(context, state);
                  } else {
                    return const Center(child: Text("Ошибка загрузки данных"));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSensorData(BuildContext context, SensorLoaded state) {
    final theme = Theme.of(context);
    final predictions = state.analysis.analysis.sensorAnalysis.predictions;
    final recommendations =
        state.analysis.analysis.sensorAnalysis.recommendations;
    final metrics = state.metrics;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCard(
            theme,
            "Вероятность превышения",
            Icons.warning_amber_rounded,
            [
              _buildRow(
                "7 дней",
                "${(predictions.exceedanceProbabilities.days7 * 100).toInt()}%",
              ),
              _buildRow(
                "14 дней",
                "${(predictions.exceedanceProbabilities.days14 * 100).toInt()}%",
              ),
              _buildRow(
                "30 дней",
                "${(predictions.exceedanceProbabilities.days30 * 100).toInt()}%",
              ),
            ],
          ),
          const SizedBox(height: 10),
          _buildCard(
            theme,
            "Рекомендации",
            Icons.lightbulb_outline,
            recommendations.map<Widget>((rec) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  "🔹 ${rec.action} (${rec.priority}): ${rec.reason}",
                  style: AppFonts.getTextMedium(size: 15),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 10),
          _buildCard(theme, "График значений", Icons.show_chart, [
            _buildChart(metrics, theme),
          ]),
        ],
      ),
    );
  }

  Widget _buildCard(
    ThemeData theme,
    String title,
    IconData icon,
    List<Widget> children,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 5, offset: Offset(0, 3)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: theme.colorScheme.primary),
              const SizedBox(width: 10),
              Text(title, style: AppFonts.getTextMedium(size: 18)),
            ],
          ),
          const SizedBox(height: 10),
          ...children,
        ],
      ),
    );
  }

  Widget _buildRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: AppFonts.getTextMedium(size: 14)),
          Text(value, style: AppFonts.getTextMedium(size: 16)),
        ],
      ),
    );
  }

  Widget _buildChart(List<Metrics> metrics, ThemeData theme) {
    return SizedBox(
      height: 200,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: false),
          titlesData: FlTitlesData(show: false),
          borderData: FlBorderData(show: false),
          lineBarsData: [
            LineChartBarData(
              spots:
                  metrics
                      .map(
                        (m) => FlSpot(
                          metrics.indexOf(m).toDouble(),
                          m.value.toDouble(),
                        ),
                      )
                      .toList(),
              isCurved: true,
              color: theme.colorScheme.primary,
              dotData: FlDotData(show: false),
            ),
          ],
        ),
      ),
    );
  }
}

class _DetectorCardLarge extends StatefulWidget {
  final Detector detector;

  const _DetectorCardLarge({required this.detector});

  @override
  State<_DetectorCardLarge> createState() => _DetectorCardLargeState();
}

class _DetectorCardLargeState extends State<_DetectorCardLarge> {
  late bool isSwitched;

  @override
  void initState() {
    super.initState();
    isSwitched = Random().nextBool();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 5, offset: Offset(0, 3)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.sensors, size: 30, color: theme.colorScheme.primary),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  widget.detector.name,
                  style: AppFonts.getTextMedium(size: 18),
                ),
              ),
              Switch.adaptive(
                value: isSwitched,
                onChanged: (value) {
                  setState(() => isSwitched = value);
                },
                activeColor: theme.colorScheme.primary,
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Тип: ${widget.detector.currentMetricsType}",
                style: AppFonts.getCompactMedium(size: 14, color: Colors.grey),
              ),
              Text(
                "${widget.detector.currentMetricsValue} ${widget.detector.currentMetricsUnit}",
                style: AppFonts.getWideRegular(size: 20),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
