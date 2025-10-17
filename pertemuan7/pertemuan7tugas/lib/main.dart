import 'package:flutter/material.dart';

void main() {
  runApp(const AppTugas());
}

class AppTugas extends StatelessWidget {
  const AppTugas({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Layout & Navigasi - Tugas (Assets)',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (_) => const ProfilPage(),
        '/gallery': (_) => const GaleriPage(),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
    );
  }
}

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  static const String profileAssetPath = 'assets/images/profile.jpg';

  @override
  Widget build(BuildContext context) {
    final mkSemester5 = const [
      ('Kecerdasan Bisnis', 'Dashboard KPI & insight'),
      ('Data Mining', 'Eksplorasi & prediksi data'),
      ('Manajemen Rantai Pasok', 'Distribusi & SCM'),
      ('Metodologi Penelitian', 'Proposal & laporan ilmiah'),
      ('K3 & Etika Profesi', 'Keselamatan & tanggung jawab'),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Mahasiswa'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.pushNamed(context, '/gallery'),
        label: const Text('Buka Galeri'),
        icon: const Icon(Icons.photo_library_outlined),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // ===== Header Profil: Row + Container (styling) =====
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.indigo.withOpacity(.06),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.indigo.withOpacity(.25)),
              ),
              child: Row(
                children: [
                  // Avatar dari assets + fallback
                  SizedBox(
                    width: 72,
                    height: 72,
                    child: ClipOval(
                      child: Image.asset(
                        profileAssetPath,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stack) {
                          // fallback saat file belum ada / salah path
                          return Container(
                            color: Colors.indigo,
                            alignment: Alignment.center,
                            child: const Text(
                              'SD',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Sufyan Dwi Bagaskara',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        SizedBox(height: 4),
                        Text('D4 Sistem Informasi Bisnis — Polinema'),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // ===== Tentang Saya =====
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.indigo.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                'Tentang Saya: Saya Sufyan Dwi Bagaskara ',
              ),
            ),

            const SizedBox(height: 12),

            // ===== ListView: Mata Kuliah Semester 5 =====
            Expanded(
              child: ListView.separated(
                itemCount: mkSemester5.length,
                separatorBuilder: (_, __) => const SizedBox(height: 6),
                itemBuilder: (context, i) {
                  final (nama, desk) = mkSemester5[i];
                  return Card(
                    elevation: 1,
                    child: ListTile(
                      leading: const Icon(Icons.book_outlined),
                      title: Text(nama),
                      subtitle: Text(desk),
                      trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
                      onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Pilih: $nama'), duration: const Duration(milliseconds: 900)),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GaleriPage extends StatelessWidget {
  const GaleriPage({super.key});

  @override
  Widget build(BuildContext context) {
    final data = List.generate(12, (i) => 'Gambar ${i + 1}');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Galeri'),
        actions: [
          IconButton(
            tooltip: 'Kembali ke Profil',
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: GridView.builder(
          itemCount: data.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, i) {
            return InkWell(
              onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Buka ${data[i]}')),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.primaries[i % Colors.primaries.length].shade200,
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.image, size: 42, color: Colors.white),
                    const SizedBox(height: 6),
                    Text(
                      data[i],
                      style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.home_outlined),
        label: const Text('Kembali'),
      ),
    );
  }
}
