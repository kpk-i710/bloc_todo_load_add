import 'package:bloc_todo_load_add_event/bloc/todos_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TodosBloc>(
          create: (context) => TodosBloc()
            ..add(LoadTodos(todos: [for (int i = 0; i < 10; i++) "пошел $i"])),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.blue,
        ),
        home: const Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TodosBloc, TodosState>(
        builder: (context, state) {
          if (state is TodosLoading)
            return Center(child: CircularProgressIndicator());
          if (state is TodosLoaded)
            return ListView.builder(
                itemCount: state.todos.length,
                itemBuilder: (context, index) {
                  return Text("${state.todos[index]}");
                });
          else
            return Text("Ошибка");
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<TodosBloc>().add(AddTodo(todo: "новый"));
        },
      ),
    );
  }
}
