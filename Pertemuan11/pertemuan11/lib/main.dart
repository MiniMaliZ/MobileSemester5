import 'package:flutter/material.dart';

void main() {
  runApp(const AppStateContainer(child: MyApp()));
}

/// ============================
/// AppStateContainer (Stateful)
/// Menyimpan state counter & increment
/// ============================

class AppStateContainer extends StatefulWidget {
  final Widget child;

  const AppStateContainer({super.key, required this.child});

  @override
  State<AppStateContainer> createState() => _AppStateContainerState();
}

class _AppStateContainerState extends State<AppStateContainer> {
  int _counter = 0;

  void _increment() {
    setState(() {
      _counter++;
    });
    debugPrint('Counter sekarang: $_counter');
  }

  @override
  Widget build(BuildContext context) {
    return AppState(
      counter: _counter,
      increment: _increment,
      child: widget.child,
    );
  }
}

/// ============================
/// InheritedWidget: share counter + increment
/// ============================

class AppState extends InheritedWidget {
  final int counter;
  final VoidCallback increment;

  const AppState({
    super.key,
    required this.counter,
    required this.increment,
    required super.child,
  });

  /// Helper untuk akses mudah
  static AppState of(BuildContext context) {
    final AppState? result =
        context.dependOnInheritedWidgetOfExactType<AppState>();
    assert(result != null, 'AppState tidak ditemukan di context');
    return result!;
  }

  @override
  bool updateShouldNotify(covariant AppState oldWidget) {
    // INI YANG PENTING:
    // Rebuild kalau nilai counter BERUBAH
    return oldWidget.counter != counter;
  }
}

/// ============================
/// Multi View (Multi Screen)
/// ============================

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'State Management InheritedWidget',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // Bikin MainScreen "depend" ke AppState
    final appState = AppState.of(context);

    // Biar tiap rebuild dapet versi terbaru
    final List<Widget> screens = const [
      HomeView(),
      DetailView(),
      SettingsView(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Multiview + InheritedWidget'),
        centerTitle: true,
      ),
      body: screens[_currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: appState.increment,
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (idx) {
          setState(() {
            _currentIndex = idx;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Detail',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

/// ============================
/// View 1: Home
/// ============================

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = AppState.of(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Home View',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Text(
            'Counter: ${appState.counter}',
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 8),
          const Text(
            'Nilai ini dibagikan lewat InheritedWidget\n'
            'dan sama di semua view.',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

/// ============================
/// View 2: Detail
/// ============================

class DetailView extends StatelessWidget {
  const DetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = AppState.of(context);

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Detail View',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Card(
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const Text(
                    'Informasi Counter dari InheritedWidget:',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${appState.counter}',
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Tekan tombol + di pojok kanan bawah\ndari view manapun dan lihat nilai ini berubah.',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// ============================
/// View 3: Settings
/// ============================

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = AppState.of(context);

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Settings View',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Text(
            'Current Counter: ${appState.counter}',
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 12),
          ElevatedButton.icon(
            onPressed: appState.increment,
            icon: const Icon(Icons.add),
            label: const Text('Tambah Counter dari Settings'),
          ),
          const SizedBox(height: 12),
          const Text(
            'View ini juga mengakses dan mengubah state yang sama\n'
            'lewat InheritedWidget.',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
