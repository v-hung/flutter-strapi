import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/app/model/user.dart';
import 'package:meta/meta.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  // void login
}