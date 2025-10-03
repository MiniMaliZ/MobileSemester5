import 'package:flutter/material.dart';

void main() => runApp(const MateriWidgetApp());

class MateriWidgetApp extends StatelessWidget {
  const MateriWidgetApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Latihan Materi Widget',
      debugShowCheckedModeBanner: false,
      home: DrawerDemo(),
    );
  }
}

class DrawerDemo extends StatelessWidget {
  const DrawerDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Drawer Demo')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text('Menu Latihan'),
              accountEmail: Text('Materi Widget Dasar'),
              currentAccountPicture: CircleAvatar(child: Icon(Icons.school)),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Beranda'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Pengaturan'),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
      body: const Center(child: Text('Geser dari kiri atau klik icon untuk membuka Drawer')),
    );
  }
}