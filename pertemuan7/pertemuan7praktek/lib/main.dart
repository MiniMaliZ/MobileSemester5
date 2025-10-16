import 'package:flutter/material.dart';

void main() {
  runApp(const StylingPositioningDemo());
}

class StylingPositioningDemo extends StatelessWidget {
  const StylingPositioningDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Styling & Positioning Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Styling & Positioning'),
          backgroundColor: Colors.indigo,
        ),
        body: Center(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              // ====== KARTU UTAMA ======
              Container(
                width: 260,
                height: 160,
                decoration: BoxDecoration(
                  color: Colors.indigo.shade50,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.indigo, width: 2),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(2, 4),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Kartu Profil Flutter',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Styling & positioning\nCihuyyyy',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

              // ====== BADGE (PAKAI ALIGN DAN PADDING) ======
              Positioned(
                top: -10,
                right: -10,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.red.shade400,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    'NEW',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              // ====== HIASAN BULAT DI BAWAH ======
              Positioned(
                bottom: -20,
                left: 100,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: Colors.indigo,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: const Icon(Icons.star, color: Colors.white, size: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
