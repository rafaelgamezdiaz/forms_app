import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  // Constructor
  CounterBloc() : super(const CounterState()) {
    on<CounterIncremented>(_onCounterIncreased);
    on<CounterReset>(_onCounterReset);
  }

  void _onCounterIncreased(
    CounterIncremented event,
    Emitter<CounterState> emit,
  ) {
    emit(
      state.copyWith(
        counter: state.counter + event.incrementValue,
        transactionCount: state.transactionCount + 1,
      ),
    );
  }

  void _onCounterReset(CounterReset event, Emitter<CounterState> emit) {
    emit(state.copyWith(counter: 0));
  }

  void increaseBy([int value = 1]) {
    add(CounterIncremented(value));
  }

  void reset() {
    add(const CounterReset());
  }
}
