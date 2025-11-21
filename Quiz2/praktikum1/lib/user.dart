class User {
  final String name;
  final String email;
  final int age;

  User({
    required this.name,
    required this.email,
    required this.age,
  });

  // Konversi dari Map (JSON) ke User
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'] as String,
      email: json['email'] as String,
      age: json['age'] as int,
    );
  }

  // Konversi dari User ke Map (JSON)
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'age': age,
    };
  }

  @override
  String toString() {
    return 'User(name: $name, email: $email, age: $age)';
  }
}
