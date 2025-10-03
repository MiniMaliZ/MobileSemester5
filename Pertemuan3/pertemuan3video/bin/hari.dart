import 'dart:io';

void main() { 
  stdout.write('Masukkan Angka Hari: ');
  String? input = stdin.readLineSync();
  int hari = int.tryParse(input ?? '') ?? 0;

  switch (hari) {
    case 1:
      print('Senin');
      break;
    case 2:
      print('Selasa');
      break;
    case 3:
      print('Rabu');
      break;
    case 4:
      print('Kamis');
      break;
    case 5:
      print('Jumat');
      break;
    case 6:
      print('Sabtu');
      break;
    case 7:
      print('Minggu');
      break;
    default:
      print('Hari tidak valid');
  }
}