// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter_application_1/app/model/Product.dart';

class ProductList {
  final List<Product> data;
  ProductList({
    required this.data,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'data': data.map((x) => x.toMap()).toList(),
    };
  }

  factory ProductList.fromMap(Map<String, dynamic> map) {
    return ProductList(
      data: List<Product>.from((map['data'] as List<dynamic>).map<Product>((x) => Product.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductList.fromJson(String source) => ProductList.fromMap(json.decode(source) as Map<String, dynamic>);
}
