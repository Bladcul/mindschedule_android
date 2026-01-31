import 'package:flutter/material.dart';

void main() {
  runApp(const MindScheduleApp());
}

class MindScheduleApp extends StatelessWidget {
  const MindScheduleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MindSchedule',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MindSchedule (Test)')),
      body: const Center(
        child: Text(
          'Приложение успешно запущено 🎉',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
