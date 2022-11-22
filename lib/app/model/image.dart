// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Image {
  final ImageData? data;
  Image({
    this.data,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'data': data?.toMap(),
    };
  }

  factory Image.fromMap(Map<String, dynamic> map) {
    return Image(
      data: map['data'] != null ? ImageData.fromMap(map['data'] as Map<String,dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Image.fromJson(String source) => Image.fromMap(json.decode(source) as Map<String, dynamic>);
}

class ImageData {
  final int id;
  final ImageAttributes attributes;
  ImageData({
    required this.id,
    required this.attributes,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'attributes': attributes.toMap(),
    };
  }

  factory ImageData.fromMap(Map<String, dynamic> map) {
    return ImageData(
      id: map['id'] as int,
      attributes: ImageAttributes.fromMap(map['attributes'] as Map<String,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory ImageData.fromJson(String source) => ImageData.fromMap(json.decode(source) as Map<String, dynamic>);
}

class ImageAttributes {
  final String name;
  final String caption;
  final int width;
  final int height;
  final String url;
  final double size;

  ImageAttributes({
    required this.name,
    required this.caption,
    required this.width,
    required this.height,
    required this.url,
    required this.size,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'caption': caption,
      'width': width,
      'height': height,
      'url': url,
      'size': size,
    };
  }

  factory ImageAttributes.fromMap(Map<String, dynamic> map) {
    return ImageAttributes(
      name: map['name'] as String,
      caption: map['caption'] as String,
      width: map['width'] as int,
      height: map['height'] as int,
      url: map['url'] as String,
      size: map['size'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory ImageAttributes.fromJson(String source) => ImageAttributes.fromMap(json.decode(source) as Map<String, dynamic>);
}
