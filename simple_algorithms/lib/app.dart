import 'package:flutter/material.dart';
import 'package:simple_algorithms/views/check_odd_num.dart';
import 'package:simple_algorithms/views/san_kosh.dart';

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
      home: const SanKosh(),
    );
  }
}
