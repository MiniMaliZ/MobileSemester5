import 'dart:io';

import 'package:pertemuan4/pertemuan4.dart' as pertemuan4;

void main(List<String> arguments) {
  // var fl = List<int>.filled(4, 0);

  // fl[0] = 1;
  // fl[1] = 2;
  // fl[2] = 3;
  // fl[3] = 4;

  // stdout.writeln(fl);

  // var gl = [1,2,3];
  // gl.add(4);
  // gl.remove(2);

  // stdout.writeln(gl);


  // List Input
  // var setNilai1 = <int>{};
  // var setNilai2 = <int>{3,3,4,5};

  // stdout.write("Jumlah data setNilai1 : ");
  // String? input = stdin.readLineSync();
  // int jumlah = int.tryParse(input ?? '0') ?? 0;
  // for (var i = 0; i < jumlah; i++) {
  //   stdout.write("Masukkan nilai ke-${i+1}: ");
  //   String? nilaiInput = stdin.readLineSync();
  //   int nilai = int.tryParse(nilaiInput ?? '0') ?? 0;
  //   setNilai1.add(nilai);
  // }

  // print(setNilai1);
  // print(setNilai1.union(setNilai2));
  // print(setNilai1.intersection(setNilai2));

  // List Input String
  // var setNilai1 = <String>{};
  // var setNilai2 = <int>{3,3,4,5};

  // stdout.write("Jumlah data setNilai1 : ");
  // String? input = stdin.readLineSync();
  // int jumlah = int.tryParse(input ?? '0') ?? 0;
  // for (var i = 0; i < jumlah; i++) {
  //   stdout.write("Masukkan nilai ke-${i+1}: ");
  //   String? nilaiInput = stdin.readLineSync();
  //   String nilai = nilaiInput ?? '';
  //   setNilai1.add(nilai);
  // }

  // print(setNilai1.elementAt(1));

  var bawok = {
    'nama': 'bawok',
    'umur': 20,
    'alamat': 'indonesia',
    'nama': 'Bawokdehel'
  }; // Nama Ketumpuk / Replace

  var uwong = {
    'nama': ['uwong','buwong'],
    'umur': [20,21],
    'alamat': ['indonesia','malaysia']
  };

  print(uwong['nama']![0]);
}
