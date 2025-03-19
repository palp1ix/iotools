import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:iotools/core/theme/colors.dart';
import 'package:iotools/core/theme/fonts.dart';

class LineChartStable extends StatefulWidget {
  const LineChartStable({super.key});

  @override
  State<LineChartStable> createState() => _LineChartStableState();
}

class _LineChartStableState extends State<LineChartStable> {
  static const int areaAlpha = 160; // Эквивалент 0.5 * 255

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3,
      child: Padding(
        padding: const EdgeInsets.only(
          right: 18,
          left: 12,
          top: 24,
          bottom: 12,
        ),
        child: LineChart(mainData()),
      ),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    final style = AppFonts.getWideMedium(color: Colors.grey.withAlpha(190));
    const days = ['ПН', 'ВТ', 'СР', 'ЧТ', 'ПТ', 'СБ', 'ВС'];
    return SideTitleWidget(
      meta: meta,
      child: Text(days[value.toInt() - 1], style: style),
    );
  }

  List<Color> getGradientForY(double y, {bool isTransparent = false}) {
    const midY = 5.0;
    int alpha = isTransparent ? areaAlpha : 255;

    if (y < midY - 3.5 || y > midY + 3.5) {
      return [Colors.red.withAlpha(alpha), Colors.red.withAlpha(alpha)];
    }
    if (y < midY - 1.5 || y > midY + 1.5) {
      return [Colors.orange.withAlpha(alpha), Colors.orange.withAlpha(alpha)];
    }
    return [Colors.green.withAlpha(alpha), Colors.green.withAlpha(alpha)];
  }

  List<FlSpot> getSpots() {
    return [
      FlSpot(1, 3),
      FlSpot(2, 2),
      FlSpot(3, 5),
      FlSpot(4, 3.1),
      FlSpot(5, 4),
      FlSpot(6, 3),
      FlSpot(7, 1),
    ];
  }

  List<LineChartBarData> getLineBarsData() {
    final spots = getSpots();

    return [
      LineChartBarData(
        spots: spots,
        isCurved: true,
        barWidth: 5,
        isStrokeCapRound: true,
        gradient: LinearGradient(
          colors: spots.expand((spot) => getGradientForY(spot.y)).toList(),
        ),
        belowBarData: BarAreaData(
          show: true,
          gradient: LinearGradient(
            colors:
                spots
                    .expand(
                      (spot) => getGradientForY(spot.y, isTransparent: true),
                    )
                    .toList(),
          ),
        ),
        dotData: const FlDotData(show: false),
      ),
    ];
  }

  LineChartData mainData() {
    return LineChartData(
      lineTouchData: LineTouchData(
        touchSpotThreshold: 20, // Чувствительность касания
        touchTooltipData: LineTouchTooltipData(
          tooltipRoundedRadius: 8,
          getTooltipItems: (touchedSpots) {
            return touchedSpots.map((LineBarSpot touchedSpot) {
              return LineTooltipItem(
                '${(touchedSpot.y * 10).toInt()}%',
                const TextStyle(color: Colors.white),
              );
            }).toList();
          },
        ),
        getTouchedSpotIndicator: (barData, spotIndexes) {
          return spotIndexes.map((index) {
            return TouchedSpotIndicatorData(
              FlLine(color: AppColors.primaryColor, strokeWidth: 2),
              FlDotData(
                show: true,
                getDotPainter: (spot, percent, barData, index) {
                  return FlDotCirclePainter(
                    radius: 6,
                    color: AppColors.primaryColor,
                    strokeWidth: 2,
                    strokeColor: Colors.white,
                  );
                },
              ),
            );
          }).toList();
        },
        handleBuiltInTouches: true,
      ),
      gridData: FlGridData(show: true, drawVerticalLine: true),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: Colors.transparent),
      ),
      minX: 1,
      maxX: 7,
      minY: 0,
      maxY: 10,
      lineBarsData: getLineBarsData(),
    );
  }
}
