import 'package:flutter/widgets.dart';

import './event_state.dart';

Type _typeOf<T>() => T;

class EventStateProvider<T extends EventState> extends StatelessWidget {
  const EventStateProvider({
    Key key,
    @required this.eventState,
    @required this.child,
  }) : assert(eventState != null),
       assert(child != null),
       super(key: key);

  final T eventState;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return _EventStateProviderInherited<T>(
      eventState: eventState,
      child: child,
    );
  }

  static T of<T extends EventState>(BuildContext context) {
    final type = _typeOf<_EventStateProviderInherited<T>>();

    // Use [ancestorInheritedElementForWidgetOfExactType()] instead of [ancestorWidgetOfExactType()]
    // because of performance. [ancestorInheritedElementForWidgetOfExactType()] is a O(1) function but
    // [ancestorWidgetOfExactType()] is O(n) function.
    //
    // Use [ancestorInheritedElementForWidgetOfExactType()] instead of [inheritFromWidgetOfExactType()]
    // because we dont want the context that invokes the BlocProvider to be registered as a dependency
    // of the InheritedWidget.
    _EventStateProviderInherited<T> provider =
        context.getElementForInheritedWidgetOfExactType<_EventStateProviderInherited<T>>().widget;
    return provider?.eventState;
  }
}

class _EventStateProviderInherited<T> extends InheritedWidget {
  const _EventStateProviderInherited({
    Key key,
    @required this.eventState,
    @required Widget child,
  }) : super(key: key, child: child);

  final T eventState;

  @override
  bool updateShouldNotify(_EventStateProviderInherited oldWidget) => false;
}