import 'package:meta/meta.dart';

import './message.dart';

class MessageState {
  final bool isLoading;

  final List<Message> messages;

  const MessageState({
    @required this.isLoading,
    @required this.messages,
  })  : assert(isLoading != null),
        assert(messages != null);

  factory MessageState.initial() {
    return MessageState(
      isLoading: false,
      messages: [],
    );
  }

  MessageState copyWith({
    bool isLoading,
    List<Message> messages,
  }) {
    return MessageState(
      isLoading: isLoading ?? this.isLoading,
      messages: messages ?? this.messages,
    );
  }
}
