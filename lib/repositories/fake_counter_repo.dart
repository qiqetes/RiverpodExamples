import 'dart:math';

class FakeCounterRepo {
  static const double _probabilityOfFailure = 0.4;
  static final Random _rand = Random(0);

  static Future<int> getPlusCounter() async {
    await Future.delayed(Duration(milliseconds: _rand.nextInt(1000)));
    if (_rand.nextDouble() > _probabilityOfFailure) {
      return 1 + _rand.nextInt(2);
    } else {
      throw Exception("Couldn't fetch counter");
    }
  }
}
