// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter_application_1/app/model/image.dart';

class Product {
  final List<ProductData> data;
  Product({
    required this.data,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'data': data.map((x) => x.toMap()).toList(),
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      data: List<ProductData>.from((map['data'] as List<int>).map<ProductData>((x) => ProductData.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) => Product.fromMap(json.decode(source) as Map<String, dynamic>);
}

class ProductData {
  final int id;
  final ProductAttributes attributes;
  ProductData({
    required this.id,
    required this.attributes,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'attributes': attributes.toMap(),
    };
  }

  factory ProductData.fromMap(Map<String, dynamic> map) {
    return ProductData(
      id: map['id'] as int,
      attributes: ProductAttributes.fromMap(map['attributes'] as Map<String,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductData.fromJson(String source) => ProductData.fromMap(json.decode(source) as Map<String, dynamic>);
}

class ProductAttributes {
  final String name;
  final String slug;
  final String description;
  final String content;
  final double price;
  final double promotional_price;
  final Image image;
  final String createdAt;
  final String updatedAt;

  ProductAttributes({
    required this.name,
    required this.slug,
    required this.description,
    required this.content,
    required this.image,
    required this.price,
    required this.promotional_price,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'slug': slug,
      'description': description,
      'content': content,
      'price': price,
      'promotional_price': promotional_price,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'image': image.toMap(),
    };
  }

  factory ProductAttributes.fromMap(Map<String, dynamic> map) {
    return ProductAttributes(
      name: map['name'] as String,
      slug: map['slug'] as String,
      description: map['description'] as String,
      content: map['content'] as String,
      price: map['price'] as double,
      promotional_price: map['promotional_price'] as double,
      createdAt: map['createdAt'] as String,
      updatedAt: map['updatedAt'] as String,
      image: Image.fromMap(map['image'] as Map<String,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductAttributes.fromJson(String source) => ProductAttributes.fromMap(json.decode(source) as Map<String, dynamic>);
}
