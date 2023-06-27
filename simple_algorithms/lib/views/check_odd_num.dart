/*Пример простого алгоритма на Flutter. В этом примере мы реализуем простую проверку на 
четность числа: */
import 'package:flutter/material.dart';

class CheckOddNumber extends StatefulWidget {
  const CheckOddNumber({super.key});

  @override
  State<CheckOddNumber> createState() => _CheckOddNumberState();
}

class _CheckOddNumberState extends State<CheckOddNumber> {
  int num = 0;
  String result = '';

  void checkEventOdd() {
    setState(() {
      result = (num % 2 == 0) ? 'Жуп сан' : 'Так сан';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('CheckOddNumber'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('num: $num', style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            Text('result: $result', style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  checkEventOdd();
                },
                child: const Text('check')),
            const SizedBox(height: 20),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  num = int.tryParse(value) ?? 0;
                });
              },
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Enter',
              ),
            )
          ],
        ),
      ),
    );
  }
}
