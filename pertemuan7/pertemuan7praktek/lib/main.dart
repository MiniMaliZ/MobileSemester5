import 'package:flutter/material.dart';

void main() {
  runApp(const BuildLayoutDemo());
}

class BuildLayoutDemo extends StatelessWidget {
  const BuildLayoutDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Membangun Layout',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Layout Profil Mahasiswa'),
          backgroundColor: Colors.indigo,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // ====== BAGIAN HEADER PROFIL ======
              Row(
                children: [
                  const CircleAvatar(
                    radius: 36,
                    backgroundColor: Colors.indigo,
                    child: Text(
                      'SD',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Sufyan Dwi Bagaskara',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 4),
                      Text('D4 Sistem Informasi Bisnis - Polinema'),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // ====== BAGIAN ABOUT ======
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.indigo.shade50,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  'Tentang Saya:\nMahasiswa yang tertarik pada Flutter, Laravel, dan Data.',
                ),
              ),

              const SizedBox(height: 20),

              // ====== BAGIAN LISTVIEW MATA KULIAH ======
              Expanded(
                child: ListView(
                  children: const [
                    ListTile(
                      leading: Icon(Icons.book, color: Colors.indigo),
                      title: Text('Kecerdasan Bisnis'),
                      subtitle: Text('Mempelajari konsep BI & dashboard KPI'),
                    ),
                    ListTile(
                      leading: Icon(Icons.book, color: Colors.indigo),
                      title: Text('Data Mining'),
                      subtitle: Text('Eksplorasi & prediksi data menggunakan Python'),
                    ),
                    ListTile(
                      leading: Icon(Icons.book, color: Colors.indigo),
                      title: Text('Manajemen Rantai Pasok'),
                      subtitle: Text('Studi kasus perusahaan dan distribusi produk'),
                    ),
                    ListTile(
                      leading: Icon(Icons.book, color: Colors.indigo),
                      title: Text('Metodologi Penelitian'),
                      subtitle: Text('Penulisan ilmiah dan penyusunan proposal'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
