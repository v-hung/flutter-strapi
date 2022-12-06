import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/app/model/category_list.dart';
import 'package:flutter_application_1/app/model/product_list.dart';
import 'package:flutter_application_1/config/app.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'featured_products_state.dart';

class FeaturedProductsCubit extends Cubit<FeaturedProductsState> {
  FeaturedProductsCubit() : super(const FeaturedProductsInitial());

  Future<void> loadData(CategoryList? categories, String slug) async {
    try {
      if (categories == null) {
        throw Exception("Error");
      }
      emit(const FeaturedProductsLoading());
      // await Future.delayed(const Duration(seconds: 1));
      var params = {
        'populate[0]': 'image',
        'filters[slug][\$ne]': slug
      };

      for(var i = 0; i < categories.data.length; i++) {
        params["filters[categories][slug][\$in][$i]"] = categories.data[i].attributes.slug;
      }

      var url = Uri.https(HOST, 'api/products', params);
      var res = await http.get(url);

      // print(url);

      if (res.statusCode != 200) {
        throw Exception(res.reasonPhrase);
      }

      // var dataJSON = json.decode(res.body);
      ProductList data = ProductList.fromJson(res.body);
      emit(FeaturedProductsLoaded(featured_products: data));
    }
    catch(e) {
      emit(const FeaturedProductsError(error: 'Error'));
      // rethrow;
    }
  }
}