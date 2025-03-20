import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SensorAlertScreen extends StatelessWidget {
  final List<SensorAlert> alerts = [
    SensorAlert(
      "Холодный Цех",
      "Температура отклонилась от нормы",
      Icons.thermostat,
      Colors.red,
    ),
    SensorAlert("Склад", "Влажность превышена", Icons.water_drop, Colors.blue),
    SensorAlert(
      "Теплица",
      "Практически полное отстуствие света",
      Icons.sunny,
      Colors.green,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: Text("Уведомления IoT")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children:
              alerts.map((alert) => _buildAlertCard(alert, theme)).toList(),
        ),
      ),
    );
  }

  Widget _buildAlertCard(SensorAlert alert, ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Card(
        color: theme.colorScheme.surfaceContainer,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: alert.color.withOpacity(0.2),
            child: Icon(alert.icon, color: alert.color),
          ),
          title: Text(
            alert.location,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(alert.message),
          trailing: Icon(Icons.warning, color: theme.colorScheme.primary),
        ),
      ),
    );
  }
}

class SensorAlert {
  final String location;
  final String message;
  final IconData icon;
  final Color color;

  SensorAlert(this.location, this.message, this.icon, this.color);
}
