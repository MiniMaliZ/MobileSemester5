import 'package:flutter/material.dart';
import 'login.dart';
import 'daftarAkun.dart';
import 'beranda.dart';

final Map<String, WidgetBuilder> routes = {
  '/login': (BuildContext context) => const login(),
  '/daftarAkun': (BuildContext context) => const daftarAkun(),
  '/beranda': (BuildContext context) => const Beranda(),
};