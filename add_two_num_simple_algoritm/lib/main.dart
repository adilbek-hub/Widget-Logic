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
      home: const SimpleAlgoritm(),
    );
  }
}

class SimpleAlgoritm extends StatefulWidget {
  const SimpleAlgoritm({super.key});

  @override
  State<SimpleAlgoritm> createState() => _SimpleAlgoritmState();
}

class _SimpleAlgoritmState extends State<SimpleAlgoritm> {
  int num1 = 5;
  int num2 = 3;
  int result = 0;

  void calculateSum() {
    setState(() {
      result = num1 + num2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('SimpleAlgoritm'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Text('Num1: $num1', style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            Text('Num2: $num2', style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            Text('Result: $result', style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                calculateSum();
              },
              child: const Text('Enter'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () {
          setState(() {
            num1 = 0;
            num2 = 0;
            result = 0;
          });
        },
      ),
    );
  }
}
