import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Passing Data',
      debugShowCheckedModeBanner: false,
      home: TodosScreen(
        // generate list
        tasks: List.generate(10, (i) => Task('Task $i', 'Task Description $i')),
      ),
    ),
  );
}

// Home screen
class TodosScreen extends StatelessWidget {
  final List<Task> tasks;

  const TodosScreen({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GeeksForGeeks'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      // List builder
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(tasks[index].task_name),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(task: tasks[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

// detail screen
class DetailScreen extends StatelessWidget {
  final Task task;
  const DetailScreen({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(task.task_name),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(task.description),
      ),
    );
  }
}

class Task {
  final String task_name;
  final String description;

  Task(this.task_name, this.description);
}
