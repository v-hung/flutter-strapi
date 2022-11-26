// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter_application_1/app/model/product.dart';

class Cart {
  final int id;
  final CartAttributes attributes;
  Cart({
    required this.id,
    required this.attributes,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'attributes': attributes.toMap(),
    };
  }

  factory Cart.fromMap(Map<String, dynamic> map) {
    return Cart(
      id: map['id'] as int,
      attributes: CartAttributes.fromMap(map['attributes'] as Map<String,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Cart.fromJson(String source) => Cart.fromMap(json.decode(source) as Map<String, dynamic>);
}

class CartAttributes {
  final List<CartItem> cart_item;
  final String createdAt;
  final String updatedAt;
  CartAttributes({
    required this.cart_item,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cart_item': cart_item.map((x) => x.toMap()).toList(),
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory CartAttributes.fromMap(Map<String, dynamic> map) {
    return CartAttributes(
      cart_item: List<CartItem>.from((map['cart_item'] as List<int>).map<CartItem>((x) => CartItem.fromMap(x as Map<String,dynamic>),),),
      createdAt: map['createdAt'] as String,
      updatedAt: map['updatedAt'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CartAttributes.fromJson(String source) => CartAttributes.fromMap(json.decode(source) as Map<String, dynamic>);
}

class CartItem {
  final int id;
  final int quantity;
  final CartItemProduct product;
  CartItem({
    required this.id,
    required this.quantity,
    required this.product,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'quantity': quantity,
      'product': product.toMap(),
    };
  }

  factory CartItem.fromMap(Map<String, dynamic> map) {
    return CartItem(
      id: map['id'] as int,
      quantity: map['quantity'] as int,
      product: CartItemProduct.fromMap(map['product'] as Map<String,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory CartItem.fromJson(String source) => CartItem.fromMap(json.decode(source) as Map<String, dynamic>);
}

class CartItemProduct {
  final Product data;
  CartItemProduct({
    required this.data,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'data': data.toMap(),
    };
  }

  factory CartItemProduct.fromMap(Map<String, dynamic> map) {
    return CartItemProduct(
      data: Product.fromMap(map['data'] as Map<String,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory CartItemProduct.fromJson(String source) => CartItemProduct.fromMap(json.decode(source) as Map<String, dynamic>);
}
