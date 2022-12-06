// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter_application_1/app/model/image.dart';

class ImageList {
  final List<ImageData>? data;
  ImageList({
    this.data,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'data': data?.map((x) => x.toMap()).toList(),
    };
  }

  factory ImageList.fromMap(Map<String, dynamic> map) {
    return ImageList(
      data: map['data'] != null ? List<ImageData>.from((map['data'] as List<dynamic>).map<ImageData?>((x) => ImageData.fromMap(x as Map<String,dynamic>),),) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ImageList.fromJson(String source) => ImageList.fromMap(json.decode(source) as Map<String, dynamic>);
}
