enum CounterStateType { loading, loaded, failed }

class Counter {
  int count;
  CounterStateType state;

  Counter(this.count, this.state);
}
