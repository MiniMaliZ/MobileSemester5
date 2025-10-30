import 'package:flutter/material.dart';
import 'camera_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const CameraApp());
}

class CameraApp extends StatelessWidget {
  const CameraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Praktikum Kamera',
      debugShowCheckedModeBanner: false,
      // Implementasi Material Design (Material 3) dari Flutter
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.green,
        brightness: Brightness.light,
      ),
      home: const CameraPage(),
    );
  }
}
