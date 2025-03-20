import 'dart:math';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:iotools/core/router/router.gr.dart';
import 'package:iotools/core/theme/fonts.dart';
import 'package:iotools/data/model/detector/detector.dart';

class IoTDevicesWidget extends StatelessWidget {
  final List<Detector> detectors;

  const IoTDevicesWidget({super.key, required this.detectors});

  static const Map<String, IconData> metricIcons = {
    "Температура": Icons.thermostat,
    "Влажность": Icons.water_drop,
    "Свет": Icons.wb_sunny,
    "Давление": Icons.speed,
  };

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      sliver: SliverGrid.builder(
        itemCount: detectors.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          final detector = detectors[index];
          final icon =
              metricIcons[detector.currentMetricsType] ?? Icons.device_unknown;

          return _DetectorCard(detector: detector, icon: icon, theme: theme);
        },
      ),
    );
  }
}

class _DetectorCard extends StatefulWidget {
  final Detector detector;
  final IconData icon;
  final ThemeData theme;

  const _DetectorCard({
    required this.detector,
    required this.icon,
    required this.theme,
  });

  @override
  State<_DetectorCard> createState() => _DetectorCardState();
}

class _DetectorCardState extends State<_DetectorCard> {
  late bool isSwitched;

  @override
  void initState() {
    super.initState();
    isSwitched = Random().nextBool();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.router.push(DetectorRoute(detector: widget.detector));
      },
      child: Container(
        width: 160,
        height: 200,
        margin: const EdgeInsets.all(05),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: widget.theme.colorScheme.surfaceContainer,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(widget.icon, size: 30),
            Row(
              children: [
                Text(
                  widget.detector.currentMetricsValue.toString() +
                      widget.detector.currentMetricsUnit,
                  style: AppFonts.getWideRegular(size: 22),
                ),
                const Spacer(),
                Switch.adaptive(
                  value: isSwitched,
                  onChanged: (value) {
                    setState(() => isSwitched = value);
                  },
                  activeColor: widget.theme.colorScheme.primary,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.detector.currentMetricsType,
                  style: AppFonts.getCompactMedium(
                    size: 16,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  widget.detector.name,
                  style: AppFonts.getCompactMedium(size: 16),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
