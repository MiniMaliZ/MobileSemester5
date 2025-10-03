import 'dart:io';

import 'package:pertemuan3video/pertemuan3video.dart' as pertemuan3video;

void main(List<String> arguments) {
  // int nilai = 80;

  stdout.write('Masukkan Nilai Anda: ');
  String? input = stdin.readLineSync();
  int nilai = int.tryParse(input ?? '') ?? 0;

  if (nilai >= 80 && nilai <= 100) {
    print('Nilai Anda A');
  } else if (nilai >= 60 && nilai < 80) {
    print('Nilai Anda B');
  } else if (nilai >= 0 && nilai < 60) {
    print('Nilai Anda C');
  } else {
    print('Nilai Invalid');
  }

  // if tradisional
  if(nilai >= 60){
    print('Lulus');
  } else {
    print('Tidak Lulus');
  }

  // ternary operator
  String hasil = (nilai >= 60) ? 'Alhamdulillah Lulus' : 'Maaf anda belum Lulus';
  print(hasil);
}
