// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter_application_1/app/model/image.dart';
import 'package:flutter_application_1/app/model/product.dart';

class Collection {
  final int id;
  Collection({
    required this.id,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
    };
  }

  factory Collection.fromMap(Map<String, dynamic> map) {
    return Collection(
      id: map['id'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Collection.fromJson(String source) => Collection.fromMap(json.decode(source) as Map<String, dynamic>);
}

// class Collection {
//   final int id;
//   final List<CollectionAttributes> attributes;
//   Collection({
//     required this.id,
//     required this.attributes,
//   });

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'id': id,
//       'attributes': attributes.map((x) => x.toMap()).toList(),
//     };
//   }

//   factory Collection.fromMap(Map<String, dynamic> map) {
//     return Collection(
//       id: map['id'] as int,
//       attributes: List<CollectionAttributes>.from((map['attributes'] as List<int>).map<CollectionAttributes>((x) => CollectionAttributes.fromMap(x as Map<String,dynamic>),),),
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory Collection.fromJson(String source) => Collection.fromMap(json.decode(source) as Map<String, dynamic>);
// }

// class CollectionAttributes {
//   final String title;
//   final String slug;
//   final String description;
//   final Image image;
//   final String createdAt;
//   final String updatedAt;
//   final Product products;
//   CollectionAttributes({
//     required this.title,
//     required this.slug,
//     required this.description,
//     required this.image,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.products,
//   });

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'title': title,
//       'slug': slug,
//       'description': description,
//       'image': image.toMap(),
//       'createdAt': createdAt,
//       'updatedAt': updatedAt,
//       'products': products.toMap(),
//     };
//   }

//   factory CollectionAttributes.fromMap(Map<String, dynamic> map) {
//     return CollectionAttributes(
//       title: map['title'] as String,
//       slug: map['slug'] as String,
//       description: map['description'] as String,
//       image: Image.fromMap(map['image'] as Map<String,dynamic>),
//       createdAt: map['createdAt'] as String,
//       updatedAt: map['updatedAt'] as String,
//       products: Product.fromMap(map['products'] as Map<String,dynamic>),
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory CollectionAttributes.fromJson(String source) => CollectionAttributes.fromMap(json.decode(source) as Map<String, dynamic>);
// }
