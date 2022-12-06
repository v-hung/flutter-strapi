// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter_application_1/app/model/collection.dart';

class CollectionList {
  final List<Collection> data;
  CollectionList({
    required this.data,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'data': data.map((x) => x.toMap()).toList(),
    };
  }

  factory CollectionList.fromMap(Map<String, dynamic> map) {
    return CollectionList(
      data: List<Collection>.from((map['data'] as List<dynamic>).map<Collection>((x) => Collection.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory CollectionList.fromJson(String source) => CollectionList.fromMap(json.decode(source) as Map<String, dynamic>);
}
