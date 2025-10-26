import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Passing Data',
      debugShowCheckedModeBanner: false,
      home: TodosScreen(
        todos: List.generate(10, (i) => Todo('Task $i', 'Task Description $i')),
      ),
    ),
  );
}

class TodosScreen extends StatelessWidget {
  final List<Todo> todos;

  const TodosScreen({super.key, required this.todos});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GeeksForGeeks'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(todos[index].task_name),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(),
                  settings: RouteSettings(arguments: todos[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Cast the received arguments to a Todo type.
    final Todo task = ModalRoute.of(context)!.settings.arguments as Todo;

    return Scaffold(
      appBar: AppBar(
        title: Text(task.task_name),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(task.description),
      ),
    );
  }
}

class Todo {
  final String task_name;
  final String description;

  Todo(this.task_name, this.description);
}
