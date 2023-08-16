import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List items = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  void clearltems() {
    setState(() {
      items.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return Container(
                  margin: const EdgeInsets.all(10),
                  color: Colors.grey,
                  height: 50,
                  width: 100,
                  child: Center(
                    child: Text(
                      item.toString(),
                    ),
                  ),
                );
              },
            ),
          ),
         
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: clearltems,
        child: const Icon(Icons.delete),
      ),
    );
  }
}
