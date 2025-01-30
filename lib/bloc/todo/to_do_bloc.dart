import 'package:bloc_multiple_states/bloc/todo/to_do_event.dart';
import 'package:bloc_multiple_states/bloc/todo/to_do_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ToDoBloc extends Bloc<TodoEvent, ToDoState> {
  final List<String> todoList = [];
  ToDoBloc() : super(const ToDoState()) {
    on<RemoveListTodo>(removeListToDo);
    on<AddListTodo>(addListToDo);
  }

  void removeListToDo(RemoveListTodo event, Emitter<ToDoState> emit) {
    todoList.remove(event.task);
    emit(state.copyWith(todoList: List.from(todoList)));
  }

  void addListToDo(AddListTodo event, Emitter<ToDoState> emit) async {
    todoList.add(event.task);
    emit(state.copyWith(todoList: List.from(todoList)));
  }
}
