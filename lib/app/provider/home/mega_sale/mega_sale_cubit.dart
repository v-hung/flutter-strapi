import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/app/model/collection.dart';
import 'package:flutter_application_1/config/app.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'mega_sale_state.dart';

class MegaSaleCubit extends Cubit<MegaSaleState> {
  MegaSaleCubit() : super(MegaSaleInitial());

  Future<void> loadData() async {
    try {
      emit(const MegaSaleLoading());
      // await Future.delayed(const Duration(seconds: 1));
      var params = {
        'filters[slug][\$eq]': 'mega-sale',
        'populate[0]': 'image,products',
        'populate[1]': 'products.image'
      };
      var url = Uri.https(HOST, 'api/collections', params);
      var res = await http.get(url);

      if (res.statusCode != 200) {
        throw Exception(res.reasonPhrase);
      }

      var dataJSON = json.decode(res.body);
      Collection data = Collection.fromMap(dataJSON['data'][0]);
      emit(MegaSaleLoaded(mega_sale: data));
    }
    catch(e) {
      emit(const MegaSaleError(error: 'Error'));
      // rethrow;
    }
  }
}