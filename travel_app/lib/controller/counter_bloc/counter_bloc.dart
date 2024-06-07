import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_event.dart';
import 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc(): super(CounterInitialState(0)) {
    on<IncrementCounterEvent> ((event, emit) {
      emit(ChangeCounterValueState(state.counterValue + 1));
    });

    on<DecrementCounterEvent> ((event, emit) {
      emit(ChangeCounterValueState(state.counterValue - 1));
    });

    on<ResetCounterEvent> ((event, emit) {
      emit(ChangeCounterValueState(0));
    });
  }
}