import 'dart:convert';
import 'user.dart';

void main() {
  // Buat object User
  final user = User(
    name: 'Luqman',
    email: 'luqman@example.com',
    age: 21,
  );

  // Konversi ke JSON (String)
  final jsonString = jsonEncode(user.toJson());
  print('User ke JSON: $jsonString');

  // Misal kita terima JSON dari API
  const receivedJson = '''
  {
    "name": "Sufyan",
    "email": "sufyan@example.com",
    "age": 20
  }
  ''';

  final decoded = jsonDecode(receivedJson) as Map<String, dynamic>;
  final userFromJson = User.fromJson(decoded);

  print('JSON ke User: $userFromJson');
}
