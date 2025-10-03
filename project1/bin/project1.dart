import 'dart:io';

import 'package:project1/project1.dart' as project1;

// Constanta
const String namaDepan = 'Sufyan';

void main(List<String> arguments) {
  // print('Hello world: ${project1.calculate()}!');

  // Final
  final String namaBelakang = 'Dwi Bagaskara';

  // Variable
  int umur = 20;
  double tinggi = 172.5;
  bool jenisKelamin = true; // true = laki-laki, false = perempuan
  String alamat = 'Jl. Anila 3';
  num nilai = 85; // num bisa menampung int dan double
  dynamic sakOnoke = 'Variable Bebas';
  dynamic x = nilai;

  // List
  List<String> hobi = ['Membaca', 'Menulis', 'Coding'];
  hobi.add('Berenang');

  // Map
  Map<String, String> buku = {
    'judul': 'Pemrograman Dart',
    'penulis': 'Sufyan Dwi Bagaskara',
    'tahun': '2021'
  };
  buku['penerbit'] = 'Dicoding';
  
  // Print
  // stdout.writeln("Halo Nama Saya $namaDepan $namaBelakang ");
  // stdout.writeln("Umur Saya $umur Tahun");
  // stdout.writeln("Tinggi Saya $tinggi cm");
  // stdout.writeln("Jenis Kelamin ${jenisKelamin ? 'Laki-laki' : 'Perempuan'}");
  // stdout.writeln("Alamat Saya $alamat");
  // stdout.writeln("Nilai Saya $nilai");
  // stdout.writeln("Iki $sakOnoke");
  // stdout.writeln("Int ke Dynamic $x");
  // stdout.writeln("Hobi Saya ${hobi.join(', ')}");

  // Print Map
  stdout.writeln("Buku : $buku");
  stdout.writeln("Judul Buku : ${buku['judul']}");
}
