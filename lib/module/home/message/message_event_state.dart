import 'package:meta/meta.dart';

import './message_service.dart';
import './model/message_state.dart';
import './model/message_event.dart';
import './model/message.dart';
import '../../../core/event_state/event_state.dart';

class MessageEventState extends EventState<MessageEvent, MessageState> {
  final MessageService messageService;

  MessageEventState({
    @required this.messageService,
  }) : assert(messageService != null);

  @override
  MessageState get initialState => MessageState.initial();

  Stream<MessageState> _getMessages() async* {
    yield this.currentState.copyWith(
          isLoading: true,
        );

    Map<String, dynamic> data = await messageService.getMessages();
    List<Message> messages =
        (data['messages'] as List).map((i) => Message.fromJson(i)).toList();
    
    yield this.currentState.copyWith(
          isLoading: false,
          messages: messages,
        );
  }

  @override
  Stream<MessageState> mapEventToState(MessageEvent event) async* {
    switch (event.runtimeType) {
      case GetMessagesEvent:
        yield* _getMessages();
        break;
    }
  }
}
