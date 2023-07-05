import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<String> todos = [];

  void addTodo() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          String newTodo = '';
          return AlertDialog(
            title: const Text('Add Todo'),
            content: TextField(
              onChanged: (value) {
                newTodo = value;
              },
            ),
            actions: [
              TextButton(
                onPressed: () {
                  setState(() {
                    todos.add(newTodo);
                  });
                  Navigator.of(context).pop();
                },
                child: const Text('Кош'),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Чыгуу'))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('HomeView'),
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(todos[index]),
            onDismissed: (direction) {
              removeTodoAtIndex(index);
            },
            child: ListTile(
              title: Text(todos[index]),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addTodo,
        child: const Icon(Icons.add),
      ),
    );
  }

  void removeTodoAtIndex(int index) {
    setState(() {
      todos.removeAt(index);
    });
  }
}
