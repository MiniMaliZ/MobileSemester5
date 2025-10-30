import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> with WidgetsBindingObserver {
  CameraController? _controller;
  List<CameraDescription> _cameras = [];
  int _selectedIndex = 0;
  bool _ready = false;
  bool _switching = false; // cegah double switch
  String? _lastSavedPath;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _bootstrap();
  }

  Future<void> _bootstrap() async {
    try {
      _cameras = await availableCameras();
      // prefer belakang jika ada
      final backIndex = _cameras.indexWhere(
          (c) => c.lensDirection == CameraLensDirection.back);
      _selectedIndex = backIndex >= 0 ? backIndex : 0;
      await _initController(_selectedIndex);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gagal mendeteksi kamera: $e')),
      );
    }
  }

  Future<void> _initController(int index) async {
    // pastikan controller lama dibuang DULU
    final old = _controller;
    _controller = null;
    _ready = false;
    if (mounted) setState(() {});

    await old?.dispose();

    final cam = _cameras[index];
    final controller = CameraController(
      cam,
      ResolutionPreset.medium,
      enableAudio: false,
      // imageFormatGroup: ImageFormatGroup.yuv420, // bisa dicoba jika masih bermasalah
    );

    try {
      await controller.initialize();
      if (!mounted) {
        await controller.dispose();
        return;
      }
      _controller = controller;
      _selectedIndex = index;
      setState(() => _ready = true);
    } catch (e) {
      // pastikan dibersihkan jika gagal
      await controller.dispose();
      if (!mounted) return;
      setState(() => _ready = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gagal inisialisasi kamera: $e')),
      );
    }
  }

  Future<void> _switchCamera() async {
    if (_switching || _cameras.length < 2) {
      if (_cameras.length < 2) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Hanya ada 1 kamera di perangkat.')),
        );
      }
      return;
    }
    _switching = true;
    try {
      // cari lensa berlawanan (front/back) supaya aman kalau urutan id unik
      final currentLens = _cameras[_selectedIndex].lensDirection;
      final targetLens = currentLens == CameraLensDirection.back
          ? CameraLensDirection.front
          : CameraLensDirection.back;
      final nextIndex =
          _cameras.indexWhere((c) => c.lensDirection == targetLens);
      final idx = nextIndex >= 0 ? nextIndex : (_selectedIndex + 1) % _cameras.length;

      await _initController(idx);
    } finally {
      _switching = false;
    }
  }

  Future<void> _captureAndSave() async {
    final c = _controller;
    if (c == null || !c.value.isInitialized) return;

    try {
      final XFile shot = await c.takePicture();

      final dir = await getApplicationDocumentsDirectory();
      final picturesDir = Directory('${dir.path}/Pictures');
      if (!await picturesDir.exists()) {
        await picturesDir.create(recursive: true);
      }
      final ts = DateTime.now().millisecondsSinceEpoch;
      final ext = shot.path.split('.').last;
      final savePath = '${picturesDir.path}/IMG_$ts.$ext';
      await File(shot.path).copy(savePath);

      if (!mounted) return;
      setState(() => _lastSavedPath = savePath);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Foto tersimpan: $savePath')));
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Gagal menyimpan: $e')));
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    final c = _controller;
    if (c == null || !_ready) return;

    // rekomendasi plugin: dispose saat inactive, re-init saat resumed
    if (state == AppLifecycleState.inactive) {
      await c.dispose();
      _controller = null;
    } else if (state == AppLifecycleState.resumed) {
      // re-init kamera terakhir
      await _initController(_selectedIndex);
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_ready || _controller == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final isFront =
        _cameras[_selectedIndex].lensDirection == CameraLensDirection.front;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Camera Preview'),
        actions: [
          IconButton(
            tooltip: 'Ganti Kamera',
            onPressed: _switchCamera,
            icon: const Icon(Icons.cameraswitch_rounded),
          ),
        ],
      ),
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: _controller!.value.aspectRatio,
            child: CameraPreview(_controller!),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        _lastSavedPath == null
                            ? 'Belum ada foto tersimpan.'
                            : 'Path terakhir:\n$_lastSavedPath',
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                    const SizedBox(width: 12),
                    if (_lastSavedPath != null &&
                        File(_lastSavedPath!).existsSync())
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.file(
                          File(_lastSavedPath!),
                          width: 72,
                          height: 72,
                          fit: BoxFit.cover,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Icon(isFront ? Icons.flip_camera_android : Icons.camera_rear),
                const SizedBox(width: 8),
                Text(isFront ? 'Kamera Depan' : 'Kamera Belakang'),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _captureAndSave,
        icon: const Icon(Icons.camera_alt),
        label: const Text('Ambil & Simpan'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
