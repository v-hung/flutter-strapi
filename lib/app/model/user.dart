class User {
  final String name;
  final String username;
  final String email;

  const User({required this.name, required this.username, required this.email});

  toMap() {}

  static fromMap(Map<String, dynamic> map) {}
}