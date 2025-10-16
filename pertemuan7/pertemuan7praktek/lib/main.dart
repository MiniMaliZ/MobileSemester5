import 'package:flutter/material.dart';

void main() {
  runApp(const RouterDemo());
}

class RouterDemo extends StatelessWidget {
  const RouterDemo({super.key});

  @override
  Widget build(BuildContext context) {
    final routeParser = SimpleRouteParser();
    final routeDelegate = SimpleRouterDelegate();

    return MaterialApp.router(
      title: 'Router (Navigator 2.0)',
      routerDelegate: routeDelegate,
      routeInformationParser: routeParser,
      routeInformationProvider: PlatformRouteInformationProvider(
        initialRouteInformation: const RouteInformation(location: '/'),
      ),
    );
  }
}

// -------------------------------
// MODEL ROUTE CONFIGURATION
// -------------------------------
class PageConfig {
  final String path;
  const PageConfig(this.path);

  factory PageConfig.home() => const PageConfig('/');
  factory PageConfig.detail() => const PageConfig('/detail');
}

// -------------------------------
// ROUTE PARSER
// -------------------------------
class SimpleRouteParser extends RouteInformationParser<List<PageConfig>> {
  @override
  Future<List<PageConfig>> parseRouteInformation(
      RouteInformation routeInformation) async {
    final location = routeInformation.location ?? '/';
    if (location == '/detail') {
      return [PageConfig.home(), PageConfig.detail()];
    }
    return [PageConfig.home()];
  }

  @override
  RouteInformation? restoreRouteInformation(List<PageConfig> configuration) {
    final last = configuration.isNotEmpty ? configuration.last.path : '/';
    return RouteInformation(location: last);
  }
}

// -------------------------------
// ROUTER DELEGATE
// -------------------------------
class SimpleRouterDelegate extends RouterDelegate<List<PageConfig>>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<List<PageConfig>> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  List<PageConfig> _stack = [PageConfig.home()];

  @override
  List<PageConfig> get currentConfiguration => List.unmodifiable(_stack);

  void _pushDetail() {
    _stack = [..._stack, PageConfig.detail()];
    notifyListeners();
  }

  bool _popPage() {
    if (_stack.length > 1) {
      _stack.removeLast();
      notifyListeners();
      return true;
    }
    return false;
  }

  @override
  Future<void> setNewRoutePath(List<PageConfig> configuration) async {
    _stack = configuration;
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onPopPage: (route, result) {
        if (!route.didPop(result)) return false;
        return _popPage();
      },
      pages: _stack.map((config) {
        switch (config.path) {
          case '/detail':
            return MaterialPage(
              key: const ValueKey('detail'),
              child: DetailScreen(onBack: _popPage),
            );
          case '/':
          default:
            return MaterialPage(
              key: const ValueKey('home'),
              child: HomeScreen(onNavigate: _pushDetail),
            );
        }
      }).toList(),
    );
  }
}

// -------------------------------
// UI SCREEN: HOME
// -------------------------------
class HomeScreen extends StatelessWidget {
  final VoidCallback onNavigate;
  const HomeScreen({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Router V2: Home')),
      body: Center(
        child: ElevatedButton.icon(
          icon: const Icon(Icons.arrow_forward),
          label: const Text('Ke Halaman Detail'),
          onPressed: onNavigate,
        ),
      ),
    );
  }
}

// -------------------------------
// UI SCREEN: DETAIL
// -------------------------------
class DetailScreen extends StatelessWidget {
  final VoidCallback onBack;
  const DetailScreen({super.key, required this.onBack});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Router V2: Detail')),
      body: Center(
        child: ElevatedButton.icon(
          icon: const Icon(Icons.arrow_back),
          label: const Text('Kembali'),
          onPressed: onBack,
        ),
      ),
    );
  }
}
