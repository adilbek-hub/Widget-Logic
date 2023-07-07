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
      home: const Zametki(),
    );
  }
}

class Zametki extends StatefulWidget {
  const Zametki({super.key});

  @override
  State<Zametki> createState() => _ZametkiState();
}

class _ZametkiState extends State<Zametki> {
  List<String> notes = [];
  String newNote = '';

  void addNote() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Заметка кош'),
            content: TextField(
              onChanged: (value) {
                newNote = value;
              },
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    notes.add(newNote);
                    Navigator.of(context).pop();
                  });
                },
                child: const Icon(Icons.add),
              ),
            ],
          );
        });
  }

  void editNote(int index) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          String editedNote = notes[index];
          return AlertDialog(
            title: Text('Редактировать заметку'),
            content: TextField(
              onChanged: (value) {
                editedNote = value;
              },
              controller: TextEditingController(
                text: notes[index],
              ),
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    notes[index] = editedNote;
                    Navigator.of(context).pop();
                  });
                },
                child: const Text('Сактоо'),
              ),
            ],
          );
        });
  }

  void deleteNote(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Заметканы өчүрүү'),
          content: const Text('Сиз заметканы өчүрүүнү каалайсызбы?'),
          actions: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  notes.removeAt(index);
                  Navigator.of(context).pop();
                });
              },
              child: const Text('өчүрүү'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('өчүрбөө'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Zametki'),
      ),
      body: notes.isEmpty
          ? const Center(
              child: Text('Кнопканы басып иштеңиз'),
            )
          : Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  border: Border.all(),
                ),
                child: ListView.builder(
                    itemCount: notes.length,
                    itemBuilder: (BuildContext context, int index) {
                      final note = notes[index];
                      return ListTile(
                        title: Text(note),
                        onTap: () {
                          editNote(index);
                        },
                        onLongPress: () {
                          deleteNote(index);
                        },
                      );
                    }),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addNote();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
