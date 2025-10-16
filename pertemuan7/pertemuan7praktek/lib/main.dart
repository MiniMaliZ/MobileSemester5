import 'package:flutter/material.dart';

void main() {
  runApp(const GridViewDemo());
}

class GridViewDemo extends StatelessWidget {
  const GridViewDemo({super.key});

  @override
  Widget build(BuildContext context) {
    // contoh data gambar/icon untuk grid
    final List<Map<String, dynamic>> galeri = List.generate(12, (index) {
      return {
        'judul': 'Gambar ${index + 1}',
        'ikon': Icons.image,
        'warna': Colors.primaries[index % Colors.primaries.length],
      };
    });

    return MaterialApp(
      title: 'GridView Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('GridView (Galeri)'),
          backgroundColor: Colors.indigo,
        ),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // 3 kolom
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 1,
            ),
            itemCount: galeri.length,
            itemBuilder: (context, index) {
              final item = galeri[index];
              return GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Kamu memilih ${item['judul']}'),
                      duration: const Duration(seconds: 1),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: item['warna'].shade200,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(item['ikon'], size: 48, color: Colors.white),
                      const SizedBox(height: 8),
                      Text(
                        item['judul'],
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
