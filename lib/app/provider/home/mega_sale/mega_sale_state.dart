part of 'mega_sale_cubit.dart';

@immutable
abstract class MegaSaleState {
  const MegaSaleState();
}

class MegaSaleInitial extends MegaSaleState {
  const MegaSaleInitial();
}

class MegaSaleLoading extends MegaSaleState {
  const MegaSaleLoading();
}

class MegaSaleLoaded extends MegaSaleState {
  final Collection mega_sale;
  const MegaSaleLoaded({ required this.mega_sale});
}

class MegaSaleError extends MegaSaleState {
  final String error;
  const MegaSaleError({this.error = ''});
}