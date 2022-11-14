import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/config/app.dart';
import 'package:flutter_application_1/app/model/user.dart';
import 'package:flutter_application_1/utils/fetch.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  Future<void> login({required email, required password}) async {
    try {
      emit(const UserLoading());
      await Future.delayed(const Duration(seconds: 1));
      var url = Uri.https(HOST, 'api/auth/local');
      var res = await http.post(url, 
        body: {
          'identifier': email, 
          'password': password
        }
      );

      if (res.statusCode != 200) {
        throw Exception(res.reasonPhrase);
      }

      var data = json.decode(res.body);

      print(data['user']);

      User user = User.fromJson(data['user']);
      emit(UserLoaded(user: user));
    }
    catch(e) {
      emit(const UserError(error: 'Email or Password is correct'));
    }

    // print({email, password});

    // const user = User(name: 'hung', username: 'viethung', email: 'viethung');
    // print({user});
    // emit(UserState(user: user));
  }
}