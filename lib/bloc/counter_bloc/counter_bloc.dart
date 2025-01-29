import 'package:bloc/bloc.dart';
import 'package:bloc_multiple_states/bloc/counter_bloc/counter_event.dart';
import 'package:bloc_multiple_states/bloc/counter_bloc/counter_states.dart';

class CounterBloc extends Bloc<CounterEvent, CounterStates> {
  CounterBloc() : super(const CounterStates()) {
    on<IncrementCounter>(_increment);
    on<DecrementCounter>(_decrement);
    on<RestartCounter>(_restart);
  }

  void _increment(IncrementCounter event, Emitter<CounterStates> emit) {
    emit(state.copyWith(counter: state.counter + 1));
  }

  void _decrement(DecrementCounter event, Emitter<CounterStates> emit) {
    emit(state.copyWith(counter: state.counter - 1));
  }

  void _restart(RestartCounter event, Emitter<CounterStates> emit) {
    emit(state.copyWith(counter: 0));
  }
}
