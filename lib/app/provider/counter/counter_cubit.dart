import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial());

  void inital() async {
    emit(CounterLoaded());
  }

  void increment() async {
    emit(CounterLoaded(counter: state.counter - 1));
  }

  void decrement() async {
    emit(CounterLoaded(counter: state.counter + 1));
  }
}
