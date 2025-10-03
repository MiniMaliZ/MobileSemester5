import 'package:flutter/material.dart';

void main() => runApp(const MateriWidgetApp());

class MateriWidgetApp extends StatelessWidget {
  const MateriWidgetApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Latihan Materi Widget',
      debugShowCheckedModeBanner: false,
      home: DemoHome(),
    );
  }
}

class DemoHome extends StatefulWidget {
  const DemoHome({super.key});
  @override
  State<DemoHome> createState() => _DemoHomeState();
}

class _DemoHomeState extends State<DemoHome> {
  int _index = 0;
  final _pages = const [
    Center(child: Text('Tab Layout')),
    Center(child: Text('Tab Media')),
    Center(child: Text('Tab Buttons')),
  ];
  final _titles = const [
    'Layout',
    'Media',
    'Buttons',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_titles[_index])),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            UserAccountsDrawerHeader(
              accountName: Text('Menu Latihan'),
              accountEmail: Text('Materi Widget Dasar'),
              currentAccountPicture: CircleAvatar(child: Icon(Icons.school)),
            ),
          ],
        ),
      ),
      body: _pages[_index],
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.grid_view), label: 'Layout'),
          BottomNavigationBarItem(icon: Icon(Icons.image), label: 'Media'),
          BottomNavigationBarItem(icon: Icon(Icons.smart_button), label: 'Buttons'),
        ],
      ),
    );
  }
}