import 'dart:io';
import 'package:pertemuan3praktikum/pertemuan3praktikum.dart' as pertemuan3praktikum;

void main() {
  var dataMahasiswa = <String, int>{};

  print("===== Program Input Nilai Mahasiswa =====");

  for (int i = 1; i <= 5; i++) {
    String nama;
    // Terus-menerus meminta nama sampai inputnya tidak null dan tidak kosong.
    while (true) {
      stdout.write('Masukkan nama mahasiswa ke-$i: ');
      String? inputNama = stdin.readLineSync();

      if (inputNama != null && inputNama.isNotEmpty) {
        nama = inputNama;
        break; // Keluar dari loop jika nama valid
      } else {
        print('Nama tidak boleh kosong. Silakan coba lagi.');
      }
    }

    int nilai;
    // Terus-menerus meminta nilai sampai inputnya valid (berupa angka).
    while (true) {
      stdout.write('Masukkan nilai untuk $nama: ');
      String? inputNilai = stdin.readLineSync();

      // Konversi teks ke angka
      try {
        // Cek input null atau kosong
        if (inputNilai == null || inputNilai.isEmpty) {
          throw FormatException(); // Lemparkan error agar ditangkap oleh 'catch'
        }
        nilai = int.parse(inputNilai);
        break; // Keluar dari loop jika nilai valid
      } catch (e) {
        // Blok ini akan menangkap error jika input kosong atau bukan angka
        print('Input tidak valid. Harap masukkan angka. Coba lagi.');
      }
    }
    
    dataMahasiswa[nama] = nilai;
    print(''); 
  }

  print("\n===== Hasil Kategori Kelulusan Mahasiswa =====");

  dataMahasiswa.forEach((nama, nilai) {
    String kategori;

    if (nilai >= 80) {
      kategori = 'A';
    } else if (nilai >= 60) {
      kategori = 'B';
    } else {
      kategori = 'C';
    }

    print("Nama: $nama, Nilai: $nilai, Kategori: $kategori");
  });
}