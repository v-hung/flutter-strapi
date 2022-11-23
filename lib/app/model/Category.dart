// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter_application_1/app/model/image.dart';
import 'package:flutter_application_1/config/app.dart';

class Category {
  final int id;
  final CategoryAttributes attributes;
  Category({
    required this.id,
    required this.attributes,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'attributes': attributes.toMap(),
    };
  }

  String getIcon() {
    return "https://" + HOST + (this.attributes.icon.data?.attributes.url ?? "");
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'] as int,
      attributes: CategoryAttributes.fromMap(map['attributes'] as Map<String,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) => Category.fromMap(json.decode(source) as Map<String, dynamic>);
}

class CategoryAttributes {
  final String title;
  final String slug;
  final String? description;
  final Image icon;
  final String createdAt;
  final String updatedAt;
  CategoryAttributes({
    required this.title,
    required this.slug,
    this.description,
    required this.icon,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'slug': slug,
      'description': description,
      'icon': icon.toMap(),
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory CategoryAttributes.fromMap(Map<String, dynamic> map) {
    return CategoryAttributes(
      title: map['title'] as String,
      slug: map['slug'] as String,
      description: map['description'] != null ? map['description'] as String : null,
      icon: Image.fromMap(map['icon'] as Map<String,dynamic>),
      createdAt: map['createdAt'] as String,
      updatedAt: map['updatedAt'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryAttributes.fromJson(String source) => CategoryAttributes.fromMap(json.decode(source) as Map<String, dynamic>);
}
