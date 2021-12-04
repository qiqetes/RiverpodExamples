import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_examples/modesls/todo.dart';
import 'package:riverpod_examples/providers/counter_provider.dart';
import 'package:riverpod_examples/providers/todo_provider.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("To - Do App")),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Consumer(builder: (_, ref, __) {
            List<Todo> todos = ref.watch(todoProvider);
            return Column(
              children: <Widget>[
                for (int i = 0; i < todos.length; i++) TodoView(todo: todos[i]),
              ],
            );
          }),
        ),
      ),
      floatingActionButton: Consumer(
        builder: (_, ref, __) => FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            showDialog(context: context, builder: (_) => CreateTodoDialog());
          },
        ),
      ),
    );
  }
}

class CreateTodoDialog extends StatefulWidget {
  const CreateTodoDialog({
    Key? key,
  }) : super(key: key);

  @override
  State<CreateTodoDialog> createState() => _CreateTodoDialogState();
}

class _CreateTodoDialogState extends State<CreateTodoDialog> {
  String title = "";
  String? description;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("ToDo Creation"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            autocorrect: false,
            autofocus: true,
            maxLines: 1,
            decoration: const InputDecoration(labelText: "Title", border: OutlineInputBorder()),
            onChanged: (val) => setState(() => title = val),
          ),
          const SizedBox(height: 20),
          TextField(
            autocorrect: false,
            autofocus: true,
            maxLines: 2,
            decoration: const InputDecoration(labelText: "Description", border: OutlineInputBorder()),
            onChanged: (val) => setState(() => description = val),
          ),
        ],
      ),
      actions: [
        Consumer(
            builder: (_, ref, __) => TextButton(
                onPressed: () {
                  ref.read(todoProvider.notifier).addTodo(Todo(title, description: description?.trim()));
                  Navigator.of(context).pop();
                },
                child: const Text("OK")))
      ],
    );
  }
}

class TodoView extends ConsumerWidget {
  const TodoView({Key? key, required this.todo}) : super(key: key);
  final Todo todo;

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.teal,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    todo.title,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  todo.description != null ? Text(todo.description!) : Container()
                ],
              ),
              ElevatedButton(
                onPressed: () => ref.read(todoProvider.notifier).removeTodo(todo.id),
                child: const Icon(Icons.delete_forever),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
