import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  @JsonKey(name: 'user_name')
  final String name;

  @JsonKey(name: 'user_email')
  final String email;

  final int age;

  User({
    required this.name,
    required this.email,
    required this.age,
  });

  // dari JSON (Map) ke User
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  // dari User ke JSON (Map)
  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  String toString() => 'User(name: $name, email: $email, age: $age)';
}
