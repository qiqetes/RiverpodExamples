import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_examples/modesls/counter.dart';
import 'package:riverpod_examples/providers/counter_provider.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Center(
        child: Consumer(builder: (_, ref, ___) {
          onFailureShowSnack(ref, context);
          return Text("Counter ${ref.watch(counterProvider).count}");
        }),
      )),
      floatingActionButton: Consumer(builder: (_, ref, ___) {
        return ref.watch(counterProvider).state != CounterStateType.loading
            ? FloatingActionButton(
                onPressed: () => ref.read(counterProvider.notifier).increment(),
                child: const Icon(Icons.add),
              )
            : const CircularProgressIndicator();
      }),
    );
  }

  void onFailureShowSnack(ref, context) {
    ref.listen<Counter>(counterProvider, (prev, next) {
      if (next.state == CounterStateType.failed) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Failure fetching count to add"),
          duration: Duration(milliseconds: 700),
        ));
      }
    });
  }
}
