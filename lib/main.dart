import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_examples/counterApp/counter_screen.dart';
import 'package:riverpod_examples/todoApp/todo_screen.dart';

void main() {
  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (_) => const AppPicker(),
        '/todo': (_) => const TodoScreen(),
        '/counter': (_) => const CounterScreen(),
        // '/auth': (_) => const AuthScreen(),
      },
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
    );
  }
}

class AppPicker extends StatelessWidget {
  const AppPicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // COUNTER
              ElevatedButton(
                onPressed: () => Navigator.of(context).pushNamed('/counter'),
                child: const Text("COUNTER APP"),
              ),
              // TODOS
              ElevatedButton(
                onPressed: () => Navigator.of(context).pushNamed('/todo'),
                child: const Text("TODO APP"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
