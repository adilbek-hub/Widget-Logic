import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //[] - это литерал списка, который создает пустой список. Мы инициализируем переменную
// todos пустым списком, чтобы у нас было место для добавления и хранения задач.
  List<String> todos = [];

  void addTodo() {
    setState(() {
      todos.add('New Task');
    });
  }
//это метод, который используется для удаления задачи из списка по указанному индексу.
//todos.removeAt(index) - это вызов метода removeAt() для списка todos. Он удаляет
// элемент списка по указанному индексу.
  void remoteTodo(int index) {
    setState(() {
      todos.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('To Do List'),
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          final todo = todos[index];
          return ListTile(
            leading: Text(todo),
            trailing: IconButton(
              onPressed: () {
                remoteTodo(index);
              },
              icon: const Icon(
                Icons.delete,
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addTodo();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
