import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_examples/modesls/login_fields.dart';
import 'package:uuid/uuid.dart';

class Auth {
  final String username;
  final String password;
  final String accessToken;

  Auth({required this.username, required this.password})
      : accessToken = const Uuid().v4();

  String? isValidCredentials(String username, String password) {
    return (username == this.username && password == this.password)
        ? accessToken
        : null;
  }
}

class FakeAuthRepo {
  List<Auth> validAuths = [
    Auth(username: "admin", password: "admin"),
  ];
}
