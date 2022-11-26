import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/app/model/Cart.dart';
import 'package:flutter_application_1/app/model/User.dart';
import 'package:flutter_application_1/config/app.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

   Future<void> loadData(User? user) async {
    try {
      if (user == null) {
        throw Exception("Error");
      }
      

      emit(const CartLoading());
      // await Future.delayed(const Duration(seconds: 1));

      var url = Uri.https(HOST, 'api/carts', {
        'filters[user][id][\$eq]': user.id,
        'populate[0]': 'cart_item',
        'populate[1]': 'cart_item.product',
        'populate[2]': 'cart_item.product.image'
      });
      var res = await http.get(url);

      // print(url);

      if (res.statusCode != 200) {
        throw Exception(res.reasonPhrase);
      }

      var dataJSON = json.decode(res.body);

      print(dataJSON);

      Cart? cart = null;
      if (dataJSON['data'].length > 0) {
        cart = Cart.fromMap(dataJSON['data'][0]);
      }

      print(cart);

      // emit(CartLoaded(cart: cart));
    }
    catch(e) {
      emit(const CartError(error: 'Error'));
      // rethrow;
    }
  }
}
