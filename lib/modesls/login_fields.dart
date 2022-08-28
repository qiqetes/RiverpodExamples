class LoginFields {
  final String _username;
  final String _password;
  LoginFields({required String username, required String password})
      : _username = username,
        _password = password;

  String get username => _username;
  String get password => _password;
  @override
  String toString() {
    return "$_username $_password";
  }
}
