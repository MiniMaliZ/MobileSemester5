import 'dart:io';

void main() { 
  // break dan continue
  // for (int i = 1; i <= 10; i++) {
  //   if (i == 5) {
  //     break;
  //   }
  //   print("Perulangan ke-$i");
  // }

  for (int i = 1; i <= 10; i++) {
    if (i % 2 == 0) {
      continue;
    }
    print("Perulangan ke-$i");
  }
}