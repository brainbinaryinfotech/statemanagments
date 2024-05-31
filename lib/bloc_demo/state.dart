abstract class CounterState {
const CounterState();

}
class CounterLoading extends CounterState{}
class CounterLoaded extends CounterState{
   dynamic data;
   CounterLoaded(this.data);

}
class CounterError extends CounterState{
  dynamic error;
  CounterError(this.error);
}
