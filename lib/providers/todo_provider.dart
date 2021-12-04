import 'package:riverpod_examples/modesls/todo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodosState extends StateNotifier<List<Todo>> {
  TodosState([List<Todo>? state]) : super(state ?? []);

  void addTodo(Todo todo) {
    state = [...state, todo];
  }

  void removeTodo(String id) {
    print(id);
    state = state.where((todo) => todo.id != id).toList();
  }
}

final todoProvider = StateNotifierProvider<TodosState, List<Todo>>((ref) {
  ref.onDispose(() {
    print("disposing todos");
  });
  return TodosState([]);
});
