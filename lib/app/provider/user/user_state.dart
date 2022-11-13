part of 'user_cubit.dart';

@immutable
abstract class UserState {
  const UserState();
}

class UserInitial extends UserState {
  final User? user;
  const UserInitial({ this.user });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user': user?.toMap(),
    };
  }

  factory UserInitial.fromMap(Map<String, dynamic> map) {
    return UserInitial(
      user: map['user'] != null ? User.fromMap(map['user'] as Map<String,dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserInitial.fromJson(String source) => UserInitial.fromMap(json.decode(source) as Map<String, dynamic>);
}
