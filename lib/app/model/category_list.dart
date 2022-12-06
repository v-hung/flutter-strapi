// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter_application_1/app/model/category.dart';

class CategoryList {
  final List<Category> data;
  CategoryList({
    required this.data,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'data': data.map((x) => x.toMap()).toList(),
    };
  }

  factory CategoryList.fromMap(Map<String, dynamic> map) {
    return CategoryList(
      data: List<Category>.from((map['data'] as List<dynamic>).map<Category>((x) => Category.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryList.fromJson(String source) => CategoryList.fromMap(json.decode(source) as Map<String, dynamic>);
}
