class Product {
  final int id;
  final String name;
  final String slug;
  final String description;
  final String content;
  final String image;
  // final String description;

  // final String description;
  // final String description;
  // final String description;
  // final String description;

  const Product({required this.id, required this.username, required this.email});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as int, 
      username: json['username'] as String, 
      email: json['email'] as String
    );
  }
}