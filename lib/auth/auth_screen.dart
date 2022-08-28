import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthScreen extends ConsumerWidget {
  AuthScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: loginForm()));
  }

  Widget loginForm() {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              onChanged: (value) => username = value,
              autocorrect: false,
              decoration: const InputDecoration(
                label: Text("username"),
              ),
            ),
            TextField(
              onChanged: (value) => password = value,
              autocorrect: false,
              decoration: const InputDecoration(
                label: Text("password"),
              ),
              obscureText: true,
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: ElevatedButton(
                  onPressed: () {}, child: const Text("Sign in")),
            ),
            Consumer(builder: (_, ref, __) {
              return const Text(
                "Possible combinations: (admin admin, username password, sillyuser 12345678)",
                style: TextStyle(color: Colors.white70),
              );
            }),
          ],
        ),
      ),
    );
  }
}


class LoginFormState extends StateNotifier<Login>