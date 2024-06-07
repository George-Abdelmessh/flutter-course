import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarvel_app/controller/counter_cubit/counter_state.dart';

import '../../controller/counter_cubit/counter_cubit.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => CounterCubit.get(context).increment(),
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () => CounterCubit.get(context).reset(),
            child: const Icon(Icons.restart_alt_sharp),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () => CounterCubit.get(context).decrement(),
            child: const Icon(Icons.minimize),
          ),
        ],
      ),
      body: Center(
        child: BlocBuilder<CounterCubit, CounterCubitState>(
          builder: (context, state) {
            return Text(
             state.counter.toString(),
              style: const TextStyle(fontSize: 25),
            );
          }
        ),
      ),
    );
  }
}



// floatingActionButton: Column(
// mainAxisAlignment: MainAxisAlignment.end,
// children: [
// FloatingActionButton(
// onPressed: () => context.read<CounterBloc>().add(IncrementCounterEvent()),
// child: const Icon(Icons.add),
// ),
// const SizedBox(height: 10),
// FloatingActionButton(
// onPressed: () => context.read<CounterBloc>().add(ResetCounterEvent()),
// child: const Icon(Icons.restart_alt_sharp),
// ),
// const SizedBox(height: 10),
// FloatingActionButton(
// onPressed: () => context.read<CounterBloc>().add(DecrementCounterEvent()),
// child: const Icon(Icons.minimize),
// ),
// ],
// ),