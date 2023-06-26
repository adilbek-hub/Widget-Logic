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
      home: const MapMathod1(),
    );
  }
}

class MapMathod1 extends StatelessWidget {
  const MapMathod1({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> names = [
      'Adilbek',
      'Nura',
      'Amantur',
      'Bektur',
    ];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('MapMathod1'),
      ),
      body: ListView(
          children: names
              .map((e) => ListTile(
                    title: Text(e),
                  ))
              .toList()),
    );
  }
}
