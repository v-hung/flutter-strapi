part of 'user_cubit.dart';

@immutable
abstract class UserState {
  const UserState();

  bool get loading => false;

  String get error => '';
}

class UserInitial extends UserState {
  const UserInitial();
}

class UserLoading extends UserState {
  const UserLoading();
}

class UserLoaded extends UserState {
  final User? user;
  const UserLoaded({this.user});
}

class UserError extends UserState {
  final String error;
  const UserError({this.error = ''});
}