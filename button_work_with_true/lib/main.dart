import 'package:button_work_with_true/second_page.dart';
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
  final _textEditingController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isButtonEnabled = false;

  @override
  void initState() {
    _textEditingController.addListener(_checkInputText);
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.removeListener(_checkInputText);
    _textEditingController.dispose();
    super.dispose();
  }

  void _checkInputText() {
    setState(() {
      _isButtonEnabled = _textEditingController.text.isNotEmpty;
    });
  }

  void saveTextValue() {
    if (_formKey.currentState!.validate()) {
      final textValue = _textEditingController.text;
      if (textValue.isNotEmpty) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (c) => const SecondPage(),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('MyHomePage'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _textEditingController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Текст жаз';
                  } else {
                    return null;
                  }
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  filled: true,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _isButtonEnabled
                    ? () {
                        saveTextValue();
                      }
                    : null,
                child: const Text('Отправить'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
