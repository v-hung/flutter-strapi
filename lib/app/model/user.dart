class User {
  final int id;
  final String username;
  final String email;

  const User({required this.id, required this.username, required this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int, 
      username: json['username'] as String, 
      email: json['email'] as String
    );
  }
}