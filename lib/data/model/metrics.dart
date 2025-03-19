class Metrics {
  Metrics({
    required this.id,
    required this.detectorId,
    required this.value,
    required this.timestamp,
    required this.type,
    required this.unit,
  });

  final int id;
  final int detectorId;
  final int value;
  final DateTime timestamp;
  final String type;
  final String unit;
}
