import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_cubit/counter_cubit.dart';

class CubitCounterScreen extends StatelessWidget {
  const CubitCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: const _CubitCounterView(),
    );
  }
}

class _CubitCounterView extends StatelessWidget {
  const _CubitCounterView();

  void increaseBy(BuildContext context, [int value = 1]) {
    context.read<CounterCubit>().increaseBy(value);
  }

  @override
  Widget build(BuildContext context) {
    // final counterState = context.watch<CounterCubit>().state;

    return Scaffold(
      appBar: AppBar(
        title: context.select(
          (CounterCubit cubit) =>
              Text('Cubit Counter: ${cubit.state.transactionCount}'),
        ),
        actions: [
          IconButton(
            onPressed: () => context.read<CounterCubit>().reset(),
            icon: const Icon(Icons.refresh_rounded),
          ),
        ],
      ),

      body: Center(
        child: context.select(
          (CounterCubit cubit) => Text(
            'Counter value: ${cubit.state.counter}',
            style: const TextStyle(fontSize: 20),
          ),
        ),
        // BlocBuilder<CounterCubit, CounterState>(
        //   //buildWhen: (previous, current) => previous.counter != current.counter,
        //   builder: (context, state) {
        //     print('Counter Cambió');
        //     return Text('Counter value: ${state.counter}');
        //   },
        // ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: '1',
            onPressed: () => increaseBy(context, 3),
            child: const Text('+3'),
          ),
          SizedBox(height: 15),
          FloatingActionButton(
            heroTag: '2',
            onPressed: () => increaseBy(context, 2),
            child: const Text('+2'),
          ),
          SizedBox(height: 15),
          FloatingActionButton(
            heroTag: '3',
            onPressed: () => increaseBy(context),
            child: const Text('+1'),
          ),
        ],
      ),
    );
  }
}
