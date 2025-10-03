import 'package:flutter/material.dart';

void main() {
  runApp(SufyanApp());
}

class SufyanApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sufyan App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Sufyan App', style: TextStyle(color: Colors.white, fontFamily: 'Arial')),
          backgroundColor: Colors.green,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Hello, Sufyan!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, fontFamily: 'Arial'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Button action
              },
              child: Text('Click Me', style: TextStyle(fontFamily: 'Arial')),
            ),
          ],
        ),
      ),
    );
  }
}