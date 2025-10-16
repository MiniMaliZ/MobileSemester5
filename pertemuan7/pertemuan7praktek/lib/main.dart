import 'package:flutter/material.dart';

void main() {
  runApp(const NamedRoutesDemo());
}

class NamedRoutesDemo extends StatelessWidget {
  const NamedRoutesDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Named Routes Demo',
      // definisikan nama rute di sini
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/gallery': (context) => const GalleryPage(),
      },
    );
  }
}

// ================== HOME PAGE ==================
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home (Named Routes)'),
        backgroundColor: Colors.indigo,
      ),
      body: Center(
        child: ElevatedButton.icon(
          icon: const Icon(Icons.photo_library_outlined),
          label: const Text('Buka Galeri'),
          onPressed: () {
            // pindah halaman via nama route
            Navigator.pushNamed(context, '/gallery');
          },
        ),
      ),
    );
  }
}

// ================== GALLERY PAGE ==================
class GalleryPage extends StatelessWidget {
  const GalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> images =
        List.generate(9, (i) => 'Gambar ke-${i + 1}');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman Galeri'),
        backgroundColor: Colors.indigo,
      ),
      body: GridView.count(
        crossAxisCount: 3,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        padding: const EdgeInsets.all(12),
        children: images.map((e) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.indigo.shade100,
              borderRadius: BorderRadius.circular(12),
            ),
            alignment: Alignment.center,
            child: Text(
              e,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo,
        onPressed: () {
          // kembali ke home dengan pop
          Navigator.pop(context);
        },
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}
