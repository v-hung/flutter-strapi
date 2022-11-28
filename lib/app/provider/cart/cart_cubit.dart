import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/app/model/Cart.dart';
import 'package:flutter_application_1/app/model/User.dart';
import 'package:flutter_application_1/config/app.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  Future<void> loadData(User? user) async {
    try {
      const storage = FlutterSecureStorage();
      String? token = await storage.read(key: 'token');

      if (user == null || token == null) {
        throw Exception("Error");
      }

      emit(const CartLoading());
      // await Future.delayed(const Duration(seconds: 1));
      var params = {
        'filters[user][id][\$eq]': user.id.toString(),
        'populate[0]': 'cart_item',
        'populate[1]': 'cart_item.product',
        'populate[2]': 'cart_item.product.image'
      };

      var url = Uri.https(HOST, 'api/carts', params);
      var res = await http.get(url,
        headers: {
          'Authorization': 'Bearer $token'
        }
      );

      if (res.statusCode != 200) {
        throw Exception(res.reasonPhrase);
      }

      var dataJSON = json.decode(res.body);

      Cart cart;
      if (dataJSON['data'].length > 0) {
        cart = Cart.fromMap(dataJSON['data'][0]);
      }
      else {
        // cart = Cart(id: 1, attributes: );
        Cart? new_cart = await createCart(user);

        if (new_cart == null) {
          throw Exception("Error");
        }
        cart = new_cart;
      }

      emit(CartLoaded(cart: cart));
    }
    catch(e) {
      print(e);
      emit(const CartError(error: 'Error'));
      // rethrow;
    }
  }

  Future<Cart?> createCart(User user) async {
    try {
      const storage = FlutterSecureStorage();
      String? token = await storage.read(key: 'token');
      
      // await Future.delayed(const Duration(seconds: 1));
      var url = Uri.https(HOST, 'api/carts', {'populate[0]': 'cart_item'});
      var res = await http.post(url,
        body: {
          'data': {
            'user': user.id.toString(),
          }
        },
        headers: {
          'Authorization': 'Bearer $token'
        }
      );

      if (res.statusCode != 200) {
        throw Exception(res.reasonPhrase);
      }

      var dataJSON = json.decode(res.body);

      Cart? cart = Cart.fromMap(dataJSON['data'][0]);

      return cart;
    }
    catch(e) {
      print(e);
      return null;
      rethrow;
    }
  }

  Future<Cart?> updateCart(User user, Cart cart) async {
    try {
      const storage = FlutterSecureStorage();
      String? token = await storage.read(key: 'token');
      
      // await Future.delayed(const Duration(seconds: 1));
      var url = Uri.https(HOST, 'api/carts', {'populate[0]': 'cart_item'});
      var res = await http.post(url,
        body: {
          'data': {
            'user': user.id.toString(),
          }
        },
        headers: {
          'Authorization': 'Bearer $token'
        }
      );

      if (res.statusCode != 200) {
        throw Exception(res.reasonPhrase);
      }

      var dataJSON = json.decode(res.body);

      Cart? cart = Cart.fromMap(dataJSON['data'][0]);

      return cart;
    }
    catch(e) {
      print(e);
      return null;
      rethrow;
    }
  }
}
