import './model/demo_event.dart';
import './model/demo_state.dart';
import '../../core/event_state/event_state.dart';

class DemoEventState extends EventState<DemoEvent, DemoState> {
  @override
  DemoState get initialState => DemoState.initial();

  Stream<DemoState> _addCount() async* {
    DemoState currentState = this.currentState;
    int count = currentState.count + 1;

    yield currentState.copyWith(
      count: count,
    );
  }

  Stream<DemoState> _minusCount() async* {
    DemoState currentUiState = this.currentState;
    int count = currentUiState.count - 1;

    yield currentUiState.copyWith(
      count: count,
    );
  }

  @override
  Stream<DemoState> mapEventToState(DemoEvent event) async* {
    switch (event.runtimeType) {
      case AddCountEvent:
        yield* _addCount();
        break;
      case MinusCountEvent:
        yield* _minusCount();
        break;
    }
  }
}
