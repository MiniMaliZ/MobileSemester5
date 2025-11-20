import 'dart:convert';
import 'user.dart';

void main() {
  // JSON dari "REST API" yang tidak kompatibel (field name beda)
  const String rawJson = '''
  {
    "user_name": "Sufyan",
    "user_email": "sufyan@example.com",
    "age": 20
  }
  ''';

  print('Raw JSON: $rawJson');

  // Decode string JSON → Map
  final Map<String, dynamic> decoded =
      jsonDecode(rawJson) as Map<String, dynamic>;

  // Pakai User.fromJson yang sudah memakai @JsonKey
  final user = User.fromJson(decoded);

  print('Hasil konversi JSON → User: $user');

  // Konversi balik ke JSON (Map → String)
  final String encodedBack = jsonEncode(user.toJson());
  print('Konversi balik User → JSON: $encodedBack');
}
