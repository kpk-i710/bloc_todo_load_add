part of 'todos_bloc.dart';

@immutable
abstract class TodosEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadTodos extends TodosEvent {
  final List<String> todos;

  LoadTodos({this.todos = const []});

  @override
  List<Object> get props => [todos];
}

class AddTodo extends TodosEvent {
  final String todo;

  AddTodo({required this.todo});
}

class UpdateTodo extends TodosEvent {
  final String todo;

  UpdateTodo({required this.todo});
}

class DeleteTodo extends TodosEvent {
  final String todo;

  DeleteTodo({required this.todo});
}
