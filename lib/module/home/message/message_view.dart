import 'package:flutter/widgets.dart';
import 'package:layerkit/layerkit.dart';

import './message_http_client.dart';
import './message_service.dart';
import './message_event_state.dart';
import './model/message_event.dart';
import './widgets/folder.dart';
import './widgets/header.dart';
import './widgets/list_items.dart';
import '../../../core/event_state/event_state_provider.dart';

class MessageView extends StatefulWidget {
  @override
  _MessageViewState createState() => _MessageViewState();
}

class _MessageViewState extends State<MessageView> {
  MessageEventState _messageEventState;

  void _initMessageEventState() {
    MessageHttpClient messageHttpClient = MessageHttpClient();
    MessageService messageService = MessageService(
      client: messageHttpClient,
    );
    _messageEventState = MessageEventState(
      messageService: messageService,
    );
    _messageEventState.init();
  }

  void _getMessages() {
    _messageEventState.emitEvent(
      GetMessagesEvent(),
    );
  }

  @override
  void initState() {
    super.initState();
    _initMessageEventState();
    _getMessages();
  }

  void _disposeMessageEventState() {
    _messageEventState?.dispose();
  }

  @override
  void dispose() {
    _disposeMessageEventState();
    super.dispose();
  }

  Widget _buildMessageView() {
    List<Widget> children = [];

    children.add(Header());
    children.add(Folder());
    children.add(ListItems());

    return EventStateProvider(
      eventState: _messageEventState,
      child: ListView(
        children: children,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildMessageView();
  }
}
