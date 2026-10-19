
import 'package:flutter/material.dart';
import 'student.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: studentColor),
      home: const WeatherPage(),
    );
  }
}

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Activity 3 - Weather Dashboard'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              studentName,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.blue.shade700,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Column(
                children: [
                  Icon(Icons.wb_sunny, color: Colors.white, size: 60),
                  SizedBox(height: 12),
                  Text(
                    'Sunny',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  Text(
                    '31°C',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Weather Details',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: StatBox(
                    icon: Icons.water_drop,
                    label: 'Humidity',
                    value: '65%',
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: StatBox(
                    icon: Icons.air,
                    label: 'Wind',
                    value: '12 km/h',
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: StatBox(
                    icon: Icons.umbrella,
                    label: 'Rain',
                    value: '10%',
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: StatBox(
                    icon: Icons.thermostat,
                    label: 'Feels like',
                    value: '35°',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              'Hourly Forecast',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                HourForecast(time: 'Now', icon: Icons.wb_sunny, temp: '31°'),
                HourForecast(time: '2 PM', icon: Icons.wb_sunny, temp: '32°'),
                HourForecast(time: '3 PM', icon: Icons.cloud, temp: '30°'),
                HourForecast(time: '4 PM', icon: Icons.cloud, temp: '29°'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class StatBox extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const StatBox({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Icon(icon, size: 24),
          const SizedBox(height: 8),
          Text(label, textAlign: TextAlign.center),
          const SizedBox(height: 4),
          Text(
            value,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class HourForecast extends StatelessWidget {
  final String time;
  final IconData icon;
  final String temp;

  const HourForecast({
    super.key,
    required this.time,
    required this.icon,
    required this.temp,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(time),
        const SizedBox(height: 8),
        Icon(icon, size: 28),
        const SizedBox(height: 8),
        Text(temp),
      ],
    );
  }
}
