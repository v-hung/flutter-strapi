import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/config/app.dart';
import 'package:flutter_application_1/app/model/user.dart';
import 'package:flutter_application_1/utils/fetch.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(const UserInitial());

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

      User user = User.fromJson(data['user']);
      emit(UserLoaded(user: user));

      final storage = new FlutterSecureStorage();
      await storage.write(key: 'token', value: data['jwt']);
    }
    catch(e) {
      emit(const UserError(error: 'Email or Password is correct'));
      rethrow;
    }

    // print({email, password});

    // const user = User(name: 'hung', username: 'viethung', email: 'viethung');
    // print({user});
    // emit(UserState(user: user));
  }
}