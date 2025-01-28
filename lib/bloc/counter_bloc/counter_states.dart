// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class CounterStates extends Equatable {
  final int counter;
  const CounterStates({
    this.counter = 1,
  });

  CounterStates copyWith({
    int? counter,
  }) {
    return CounterStates(
      counter: counter ?? this.counter,
    );
  }

  @override
  List<Object?> get props => [counter];
}
