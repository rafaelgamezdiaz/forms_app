part of 'counter_bloc.dart';

sealed class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  List<Object> get props => [];
}

class CounterIncremented extends CounterEvent {
  final int incrementValue;

  const CounterIncremented(this.incrementValue);
}

class CounterReset extends CounterEvent {
  const CounterReset();
}
