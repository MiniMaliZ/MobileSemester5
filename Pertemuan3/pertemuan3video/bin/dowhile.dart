import 'dart:io';

void main() { 
  print("Masukkan Nilai awal: ");
  String? input = stdin.readLineSync();

  int i = int.tryParse(input ?? '') ?? 0;
  while (i <= 10) {
    print("Perulangan ke-$i");
    i++;
  }

  int a = int.tryParse(input ?? '') ?? 0;
  do {
    print("Perulangan ke-$i");
    i++;
  } while (i <= 10);
}