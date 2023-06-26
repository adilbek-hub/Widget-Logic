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
      home: const MathodMap2(),
    );
  }
}

class MathodMap2 extends StatelessWidget {
  const MathodMap2({super.key});

  @override
  Widget build(BuildContext context) {
    final List<int> numbers = [1, 2, 3, 4, 5];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('MathodMap2'),
      ),
      body: ListView.builder(
          itemCount: numbers.length,
          itemBuilder: (context, index) {
            final number = numbers[index];
            final isEvent = number % 2 == 0;
            return ListTile(
              title: Text('Number $number'),
              subtitle: Text(isEvent ? 'Жуп сан' : 'Так сан'),
              leading: Icon(
                isEvent ? Icons.check_box : Icons.check_box_outline_blank,
                color: isEvent ? Colors.green : Colors.red,
              ),
            );
          }),
    );
  }
}
