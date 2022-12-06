import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/config/app.dart';
import 'package:flutter_application_1/app/model/user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(const UserInitial());

  Future<void> login({required email, required password}) async {
    try {
      emit(const UserLoading());
      // await Future.delayed(const Duration(seconds: 1));
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

      User user = User.fromMap(data['user']);

      final storage = new FlutterSecureStorage();
      await storage.write(key: 'token', value: data['jwt']);
      
      emit(UserLoaded(user: user));
    }
    catch(e) {
      emit(const UserError(error: 'Email or Password is correct'));
      rethrow;
    }
  }

  Future<void> logged() async {
    try {
      const storage = FlutterSecureStorage();
      String? token = await storage.read(key: 'token');

      var url = Uri.https(HOST, 'api/users/me');
      var res = await http.get(url,
        headers: {
          'Authorization': 'Bearer $token'
        }
      );

      if (res.statusCode != 200) {
        throw Exception(res.reasonPhrase);
      }

      User user = User.fromJson(res.body);

      emit(UserLoaded(user: user));
    }
    catch(e) {
      emit(const UserInitial());
    }
  }
}