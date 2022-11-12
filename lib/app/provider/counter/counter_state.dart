part of 'counter_cubit.dart';

@immutable
abstract class CounterState {

  const CounterState();

  get counter => null;
}

class CounterInitial extends CounterState {
  const CounterInitial();
}

class CounterLoading extends CounterState {
  const CounterLoading();
}

class CounterLoaded extends CounterState {
  final int counter;
  const CounterLoaded({this.counter = 0});
}

class CounterError extends CounterState {
  final String? message;
  const CounterError({this.message});
}
