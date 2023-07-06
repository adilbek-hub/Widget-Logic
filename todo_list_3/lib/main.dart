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
  List<String> todos = [];
  final _textEditingController = TextEditingController();

  void addTodo() {
    setState(() {
      todos.add(_textEditingController.text);
      _textEditingController.clear();
    });
  }

  void removeTodo(index) {
    setState(() {
      todos.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('ToDo List 3'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[300],
              ),
              child: todos.isEmpty
                  ? const Center(
                      child: Text('Сиз жазган список мага сакталат'),
                    )
                  : ListView.builder(
                      itemCount: todos.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Text(
                            todos[index],
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              removeTodo(index);
                            },
                            icon: const Icon(Icons.delete),
                          ),
                        );
                      },
                    ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _textEditingController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                filled: true,
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () {
                addTodo();
              },
              icon: const Icon(Icons.add),
              label: const Text('Список кош'),
            ),
          ],
        ),
      ),
    );
  }
}
