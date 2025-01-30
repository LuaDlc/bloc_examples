// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();
}

class AddListTodo extends TodoEvent {
  final String task;
  const AddListTodo({
    required this.task,
  });

  @override
  List<Object?> get props => [];
}

class RemoveListTodo extends TodoEvent {
  final Object task;
  const RemoveListTodo({
    required this.task,
  });
  @override
  List<Object?> get props => [task];
}
