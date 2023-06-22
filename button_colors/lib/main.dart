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
        scaffoldBackgroundColor: Colors.grey,
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
  Color buttonColor1 = Colors.blue;
  Color buttonColor2 = Colors.blue;
  void changeButtonColors() {
    setState(() {
      if (buttonColor1 == Colors.blue) {
        buttonColor1 = Colors.red;
        buttonColor2 = Colors.blue;
      } else if (buttonColor2 == Colors.blue) {
        buttonColor1 = Colors.blue;
        buttonColor2 = Colors.red;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('MyHomePage'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: buttonColor1),
              onPressed: () {
                changeButtonColors();
              },
              child: const Text('First'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: buttonColor2),
              onPressed: () {
                changeButtonColors();
              },
              child: const Text('Second'),
            ),
          ],
        ),
      ),
    );
  }
}
