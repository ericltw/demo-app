import 'package:layerkit/layerkit.dart';

import '../model/message_state.dart';
import '../model/message.dart';
import '../message_event_state.dart';
import '../../../../core/event_state/event_state_provider.dart';
import '../../../../core/event_state/event_state_builder.dart';

const _kSpacerListItems = 16.0;
const _kSpacerBetweenListItems = 12.0;

class ListItems extends StatelessWidget {
  IndexedWidgetBuilder _itemBuilder(List<Message> messages) {
    return (BuildContext context, int index) {
      return LEListItem(
        identifierAvatarImage:
            AssetImage('assets/${messages[index].avatar}.jpeg'),
        primaryIdentifier: messages[index].title,
        note: messages[index].time,
        previewText: messages[index].content,
      );
    };
  }

  Widget _buildListItems(BuildContext context) {
    MessageEventState eventState =
        EventStateProvider.of<MessageEventState>(context);

    return EventStateBuilder(
      state: eventState.state,
      builder: (BuildContext context, MessageState state) {
        List<Message> messages = state.messages;

        return ListView.separated(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          padding: EdgeInsets.symmetric(
            vertical: _kSpacerListItems,
          ),
          itemBuilder: _itemBuilder(messages),
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(height: _kSpacerBetweenListItems);
          },
          itemCount: messages.length,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildListItems(context);
  }
}
