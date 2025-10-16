import 'package:flutter/material.dart';

void main() {
  runApp(const ListViewDemo());
}

class ListViewDemo extends StatelessWidget {
  const ListViewDemo({super.key});

  @override
  Widget build(BuildContext context) {
    // Contoh data dinamis
    final List<Map<String, String>> mataKuliah = [
      {
        'nama': 'Kecerdasan Bisnis',
        'deskripsi': 'Mempelajari dashboard KPI dan analisis data bisnis'
      },
      {
        'nama': 'Data Mining',
        'deskripsi': 'Mengenali pola dan klasifikasi data menggunakan Python'
      },
      {
        'nama': 'Metodologi Penelitian',
        'deskripsi': 'Menyusun proposal dan laporan ilmiah'
      },
      {
        'nama': 'Manajemen Rantai Pasok',
        'deskripsi': 'Analisis distribusi dan supply chain'
      },
      {
        'nama': 'K3 & Etika Profesi',
        'deskripsi': 'Keselamatan kerja dan tanggung jawab profesional'
      },
    ];

    return MaterialApp(
      title: 'ListView Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('ListView & List Item Widget'),
          backgroundColor: Colors.indigo,
        ),
        body: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: mataKuliah.length,
          itemBuilder: (context, index) {
            final item = mataKuliah[index];
            return Card(
              elevation: 2,
              margin: const EdgeInsets.symmetric(vertical: 6),
              child: ListTile(
                leading: const Icon(Icons.book, color: Colors.indigo),
                title: Text(item['nama']!),
                subtitle: Text(item['deskripsi']!),
                trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
                onTap: () {
                  // menampilkan snackbar saat diklik
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Kamu memilih: ${item['nama']}'),
                      duration: const Duration(seconds: 1),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
