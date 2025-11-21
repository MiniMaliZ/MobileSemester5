// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
  name: json['user_name'] as String,
  email: json['user_email'] as String,
  age: (json['age'] as num).toInt(),
);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'user_name': instance.name,
  'user_email': instance.email,
  'age': instance.age,
};
