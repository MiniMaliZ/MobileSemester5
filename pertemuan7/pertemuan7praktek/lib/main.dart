import 'package:flutter/material.dart';

void main() {
  runApp(const MultiChildLayoutDemo());
}

class MultiChildLayoutDemo extends StatelessWidget {
  const MultiChildLayoutDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Multi-child Layout Demo',
      home: Scaffold(
        appBar: AppBar(title: const Text('Multi-child Layout')),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // ====== ROW ======
            const Text(
              'Row Example:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                ColorBox(color: Colors.red, label: 'A'),
                ColorBox(color: Colors.green, label: 'B'),
                ColorBox(color: Colors.blue, label: 'C'),
              ],
            ),
            const SizedBox(height: 24),

            // ====== COLUMN ======
            const Text(
              'Column Example:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('• Item 1'),
                Text('• Item 2'),
                Text('• Item 3'),
              ],
            ),
            const SizedBox(height: 24),

            // ====== STACK ======
            const Text(
              'Stack Example:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(width: 160, height: 160, color: Colors.amber),
                  Container(width: 100, height: 100, color: Colors.orange),
                  Container(width: 60, height: 60, color: Colors.deepOrange),
                  const Text(
                    'Tumpuk!',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ColorBox extends StatelessWidget {
  final Color color;
  final String label;
  const ColorBox({super.key, required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      color: color,
      alignment: Alignment.center,
      child: Text(label, style: const TextStyle(color: Colors.white)),
    );
  }
}
