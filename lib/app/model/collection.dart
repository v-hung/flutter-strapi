class Collection {
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

  const Collection({});

  factory Collection.fromJson(Map<String, dynamic> json) {
    return Collection(
      id: json['id'] as int, 
      username: json['username'] as String, 
      email: json['email'] as String
    );
  }
}