
import 'package:flutter/material.dart';
import 'student.dart';

void main() {
  runApp(const WaterTrackerApp());
}

class WaterTrackerApp extends StatelessWidget {
  const WaterTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: studentColor),
      home: const WaterTrackerPage(),
    );
  }
}

class WaterTrackerPage extends StatefulWidget {
  const WaterTrackerPage({super.key});

  @override
  State<WaterTrackerPage> createState() => _WaterTrackerPageState();
}

class _WaterTrackerPageState extends State<WaterTrackerPage> {
  int _glasses = 0;
  final int _goal = 6;

  void _addGlass() {
    if (_glasses < _goal) {
      setState(() {
        _glasses++;
      });
    }
  }

  void _removeGlass() {
    if (_glasses > 0) {
      setState(() {
        _glasses--;
      });
    }
  }

  void _reset() {
    setState(() {
      _glasses = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('build() called: $_glasses glasses');

    final double progress = _glasses / _goal;
    final bool goalReached = _glasses >= _goal;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Activity 2 - Water Tracker'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                studentName,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),
              Icon(
                goalReached ? Icons.check_circle : Icons.water_drop,
                size: 90,
                color: goalReached ? Colors.green : Colors.blue,
              ),
              const SizedBox(height: 16),
              Text(
                '$_glasses / $_goal glasses',
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              LinearProgressIndicator(
                value: progress,
                minHeight: 12,
                borderRadius: BorderRadius.circular(8),
              ),
              const SizedBox(height: 20),
              Text(
                goalReached
                    ? 'Great job! You reached your water goal!'
                    : 'Drink water and stay hydrated!',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 24),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 12,
                runSpacing: 12,
                children: [
                  ElevatedButton.icon(
                    onPressed: _removeGlass,
                    icon: const Icon(Icons.remove),
                    label: const Text('Remove'),
                  ),
                  ElevatedButton.icon(
                    onPressed: _addGlass,
                    icon: const Icon(Icons.add),
                    label: const Text('Add glass'),
                  ),
                  OutlinedButton.icon(
                    onPressed: _reset,
                    icon: const Icon(Icons.refresh),
                    label: const Text('Reset'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
