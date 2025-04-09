import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_bloc/counter_bloc.dart';

class BlocCounterScreen extends StatelessWidget {
  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterBloc(),
      child: const _BlocCounterView(),
    );
  }
}

class _BlocCounterView extends StatelessWidget {
  const _BlocCounterView();

  void increaseBy(BuildContext context, [int value = 1]) {
    context.read<CounterBloc>().increaseBy(value); // add dispara el evento

    // Sin hacer uso de la función increaseBy
    // context.read<CounterBloc>().add(
    //   CounterIncremented(value),
    // ); // add dispara el evento
  }

  void reset(BuildContext context) {
    // context.read<CounterBloc>().add(const CounterReset());
    context.read<CounterBloc>().reset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: context.select(
          (CounterBloc bloc) =>
              Text('Bloc Counter: ${bloc.state.transactionCount}'),
        ),
        actions: [
          IconButton(
            onPressed: () => reset(context),
            icon: const Icon(Icons.refresh_rounded),
          ),
        ],
      ),

      body: Center(
        child: context.select(
          (CounterBloc bloc) => Text('Counter value: ${bloc.state.counter}'),
        ),
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
            onPressed: () => increaseBy(context, 1),
            child: const Text('+1'),
          ),
        ],
      ),
    );
  }
}
