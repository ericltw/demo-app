import 'package:flutter/widgets.dart';

typedef AsyncEventStateBuilder<State> = Widget Function(
    BuildContext context, State state);

class EventStateBuilder<State> extends StatelessWidget {
  final Stream<State> state;

  final AsyncEventStateBuilder<State> builder;

  const EventStateBuilder({
    Key key,
    @required this.state,
    @required this.builder,
  })  : assert(state != null),
        assert(builder != null),
        super(key: key);

  Widget _buildEventStateBuilder() {
    return StreamBuilder<State>(
      stream: state,
      builder: (BuildContext context, AsyncSnapshot<State> snapshot) {
        if (snapshot.hasData) {
          return builder(context, snapshot.data);
        }
        return SizedBox.shrink();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildEventStateBuilder();
  }
}
