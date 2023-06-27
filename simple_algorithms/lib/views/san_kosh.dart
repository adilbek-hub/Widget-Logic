import 'package:flutter/material.dart';

//1ден 10го чейинки сандарды кошкон жөнөкөй алгоритм
class SanKosh extends StatefulWidget {
  const SanKosh({super.key});

  @override
  State<SanKosh> createState() => _SanKoshState();
}

class _SanKoshState extends State<SanKosh> {
  int result = 0;
  void runAlgorithm() {
    int sum = 0;
    for (int i = 1; i <= 10; i++) {
      sum += i;
    }
    setState(() {
      result = sum;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('SanKosh'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Resultat:'),
            Text('$result'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: runAlgorithm,
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
