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
      home: const ToggleButton(),
    );
  }
}

class ToggleButton extends StatefulWidget {
  const ToggleButton({super.key});

  @override
  State<ToggleButton> createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  bool isButtonPressed = false;

  void toggleButton() {
    setState(() {
      isButtonPressed = !isButtonPressed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('TogleButton'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isButtonPressed == false)
              const Text('Свет OFF')
            else if (isButtonPressed == true)
              const Text('Свет ON'),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                toggleButton();
              },
              child: Icon(
                Icons.light,
                color: isButtonPressed ? Colors.red : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
