abstract class CounterState {
  final int counterValue;
  const CounterState(this.counterValue);
}

class CounterInitialState extends CounterState {
  CounterInitialState(super.counterValue);
}

class ChangeCounterValueState extends CounterState {
  ChangeCounterValueState(super.counterValue);
}
