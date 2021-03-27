import 'package:layerkit/layerkit.dart';

import './feed/feed_view.dart';
import './message/message_view.dart';

class HomeView extends StatelessWidget {
  Widget _buildHomeView() {
    return LETabScaffold(
      bottomTabBar: LEBottomTabBar(
        icons: [
          LEIcons.message_circle_outline,
          LEIcons.compass_outline,
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        switch(index) {
          case 0:
            return MessageView();
            break;
          case 1:
            return FeedView();
            break;
          default: return null;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildHomeView();
  }
}