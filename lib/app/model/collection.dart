import 'dart:convert';

import 'package:flutter_application_1/app/model/product_list.dart';
import 'package:flutter_application_1/app/model/image.dart';

class Collection {
  final int id;
  final CollectionAttributes attributes;
  Collection({
    required this.id,
    required this.attributes,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'attributes': attributes.toMap(),
    };
  }

  factory Collection.fromMap(Map<String, dynamic> map) {
    return Collection(
      id: map['id'] as int,
      attributes: CollectionAttributes.fromMap(map['attributes'] as Map<String,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Collection.fromJson(String source) => Collection.fromMap(json.decode(source) as Map<String, dynamic>);
}

class CollectionAttributes {
  final String title;
  final String slug;
  final String? description;
  final Image image;
  final String createdAt;
  final String updatedAt;
  final ProductList products;
  CollectionAttributes({
    required this.title,
    required this.slug,
    this.description,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
    required this.products,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'slug': slug,
      'description': description,
      'image': image.toMap(),
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'products': products.toMap(),
    };
  }

  factory CollectionAttributes.fromMap(Map<String, dynamic> map) {
    return CollectionAttributes(
      title: map['title'] as String,
      slug: map['slug'] as String,
      description: map['description'] != null ? map['description'] as String : null,
      image: Image.fromMap(map['image'] as Map<String,dynamic>),
      createdAt: map['createdAt'] as String,
      updatedAt: map['updatedAt'] as String,
      products: ProductList.fromMap(map['products'] as Map<String,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory CollectionAttributes.fromJson(String source) => CollectionAttributes.fromMap(json.decode(source) as Map<String, dynamic>);
}
