import 'package:meta/meta.dart';

class DemoState {
  final int count;

  final bool isLoading;

  const DemoState({
    @required this.count,
    @required this.isLoading,
  })  : assert(count != null),
        assert(isLoading != null);

  factory DemoState.initial() {
    return DemoState(
      count: 0,
      isLoading: false,
    );
  }

  DemoState copyWith({
    int count,
    bool loading,
  }) {
    return DemoState(
      count: count ?? this.count,
      isLoading: loading ?? this.isLoading,
    );
  }
}
