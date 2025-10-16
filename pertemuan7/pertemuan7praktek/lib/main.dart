import 'package:flutter/material.dart';

void main() {
  runApp(const SingleChildLayoutDemo());
}

class SingleChildLayoutDemo extends StatelessWidget {
  const SingleChildLayoutDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Single-child Layout Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Single-child Layout'),
        ),
        body: Center(
          // Center hanya punya satu child
          child: Container(
            width: 200,
            height: 150,
            color: Colors.blue.shade100,
            padding: const EdgeInsets.all(16),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Container(
                color: Colors.blue.shade300,
                padding: const EdgeInsets.all(8),
                child: const Text(
                  'Hello Layout!',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
