import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/app/model/ImageList.dart';
import 'package:flutter_application_1/app/model/Product.dart';
import 'package:flutter_application_1/config/app.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'product_detail_state.dart';

class ProductDetailCubit extends Cubit<ProductDetailState> {
  ProductDetailCubit() : super(ProductDetailInitial());

  Future<void> loadData(String slug) async {
    try {
      emit(const ProductDetailLoading());
      // await Future.delayed(const Duration(seconds: 1));
      var params = {
        'filters[slug][\$eq]': slug,
        'populate[0]': 'image,media',
      };
      var url = Uri.https(HOST, 'api/products', params);
      var res = await http.get(url);

      if (res.statusCode != 200) {
        throw Exception(res.reasonPhrase);
      }

      var dataJSON = json.decode(res.body);
      // print(dataJSON['data'][0]['attributes']['media']);
      Product data = Product.fromMap(dataJSON['data'][0]);
      // print(data.attributes.media?.toJson());
      emit(ProductDetailLoaded(product: data));
    }
    catch(e) {
      print(e);
      emit(const ProductDetailError(error: 'Error'));
    }
  }
}
