import 'package:rxdart/rxdart.dart';

abstract class EventState<Event, State> {
  PublishSubject<Event> _eventSubject;

  BehaviorSubject<State> _stateSubject;

  State _currentState;

  State get initialState;

  void _initEventSubject() {
    _eventSubject = PublishSubject<Event>();
  }

  void _initStateSubject() {
    State seedValue = _currentState ?? initialState;

    _stateSubject = BehaviorSubject<State>.seeded(seedValue);
  }

  Stream<State> mapEventToState(Event event);

  State get currentState => _currentState ?? initialState;

  void _handleState(State state) {
    _currentState = state;

    if (!_stateSubject.isClosed) {
      _stateSubject.sink.add(state);
    }
  }

  void _bindEventState() {
    _eventSubject
      .flatMap(mapEventToState)
      .forEach(_handleState);
  }

  void init() {
    _initEventSubject();
    _initStateSubject();
    _bindEventState();
  }

  void Function(Event) get emitEvent => _eventSubject.sink.add;

  Stream<State> get state => _stateSubject.stream;

  void _disposeEventSubject() {
    _eventSubject?.close();
  }

  void _disposeStateSubject() {
    _stateSubject?.close();
  }

  void dispose() {
    _disposeEventSubject();
    _disposeStateSubject();
  }
}