import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarvel_app/controller/counter_cubit/counter_state.dart';

class CounterCubit extends Cubit<CounterCubitState> {
  CounterCubit() : super(const CounterInitState(0));

  static CounterCubit get(BuildContext context) => BlocProvider.of(context);


  void increment() {
    emit(ChangeCounterState(state.counter + 1));
  }

  void decrement() {
    emit(ChangeCounterState(state.counter -1));
  }

  void reset() {
    emit(const ChangeCounterState(0));
  }
}
