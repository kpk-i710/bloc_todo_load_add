part of 'todos_bloc.dart';

@immutable
abstract class TodosState extends Equatable {
  const TodosState();

  @override
  List<Object> get props => [];
}

class TodosLoading extends TodosState {}

class TodosLoaded extends TodosState {
  final List<String> todos;

  const TodosLoaded({this.todos = const []});

  @override
  List<Object> get props => [todos];
}
