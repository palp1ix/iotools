class Detector {
  Detector({
    required this.id,
    required this.name,
    required this.currentMetricsValue,
    required this.currentMetricsType,
    required this.currentMetricsUnit,
    required this.roomId,
    required this.minValue,
    required this.maxValue,
  });

  final int id;
  final String name;
  final int currentMetricsValue;
  final String currentMetricsType;
  final String currentMetricsUnit;
  final int roomId;
  final int minValue;
  final int maxValue;
}
