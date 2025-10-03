import 'package:flutter/material.dart';

void main() => runApp(const MateriWidgetApp());

class MateriWidgetApp extends StatelessWidget {
  const MateriWidgetApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Latihan Materi Widget',
      debugShowCheckedModeBanner: false,
      home: ScaffoldAppBarDemo(),
    );
  }
}

class ScaffoldAppBarDemo extends StatelessWidget {
  const ScaffoldAppBarDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scaffold + AppBar'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.info_outline),
            tooltip: 'Info',
          ),
        ],
      ),
      body: const Center(child: Text('Halo dari Scaffold!')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
