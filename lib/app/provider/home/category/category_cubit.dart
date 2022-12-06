import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/app/model/category_list.dart';
import 'package:flutter_application_1/config/app.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(const CategoryInitial());

  Future<void> loadData() async {
    try {
      emit(const CategoryLoading());
      // await Future.delayed(const Duration(seconds: 1));
      var params = {
        'populate[0]': 'icon'
      };
      var url = Uri.https(HOST, 'api/categories', params);
      var res = await http.get(url);

      if (res.statusCode != 200) {
        throw Exception(res.reasonPhrase);
      }

      // var dataJSON = json.decode(res.body);
      CategoryList data = CategoryList.fromJson(res.body);
      emit(CategoryLoaded(categories: data));
    }
    catch(e) {
      emit(const CategoryError(error: 'Error'));
      // rethrow;
    }
  }
}
