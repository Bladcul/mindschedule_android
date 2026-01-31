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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> tasks = [];
  final TextEditingController controller = TextEditingController();

  void addTask(String text) {
    if (text.isEmpty) return;
    setState(() {
      tasks.add(text);
    });
    controller.clear();
  }

  String getAdvice() {
    if (tasks.isEmpty) {
      return 'Добавь задачу или скажи её голосом 🎤';
    } else if (tasks.length > 5) {
      return 'Слишком много задач. Совет: разгрузи день 🧠';
    } else {
      return 'План выглядит нормально 👍';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MindSchedule v2'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Заглушка под голос
          addTask('🎤 Голосовая задача (пример)');
        },
        child: const Icon(Icons.mic),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                labelText: 'Новая задача',
              ),
              onSubmitted: addTask,
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.check_circle_outline),
                    title: Text(tasks[index]),
                  );
                },
              ),
            ),
            const Divider(),
            Text(
              'Совет: ${getAdvice()}',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
