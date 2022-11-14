import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/app/model/user.dart';
import 'package:meta/meta.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserState());

  Future<void> login() async {
    const user = User(name: 'hung', username: 'viethung', email: 'viethung');
    print({user});
    emit(UserState(user: user));
  }
}