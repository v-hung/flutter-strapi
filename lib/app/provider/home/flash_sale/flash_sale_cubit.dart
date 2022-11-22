import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/app/model/collection.dart';
import 'package:flutter_application_1/config/app.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'flash_sale_state.dart';

class FlashSaleCubit extends Cubit<FlashSaleState> {
  FlashSaleCubit() : super(FlashSaleInitial());

  Future<void> loadData() async {
    try {
      emit(const FlashSaleLoading());
      await Future.delayed(const Duration(seconds: 1));
      var params = {
        'filters[slug][\$eq]': 'flash-sale',
        'populate[0]': 'image,products',
        'populate[1]': 'products.image'
      };
      var url = Uri.https(HOST, 'api/collections', params);
      var res = await http.get(url);

      if (res.statusCode != 200) {
        throw Exception(res.reasonPhrase);
      }

      var dataJSON = json.decode(res.body);
      print((dataJSON['data']?.isEmpty));
      Collection data = Collection.fromJson(dataJSON);
      emit(FlashSaleLoaded(flash_sale: data));
    }
    catch(e) {
      print(e);
      emit(const FlashSaleError(error: 'Error'));
      // rethrow;
    }

    // print({email, password});

    // const user = User(name: 'hung', username: 'viethung', email: 'viethung');
    // print({user});
    // emit(UserState(user: user));
  }
}

// strapi.viethung.fun/api/collections?filters[slug][$eq]=flash-sale&populate[0]=image,products&populate[1]=products.image