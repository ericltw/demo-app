import 'package:layerkit/layerkit.dart';

class Header extends StatelessWidget {
  Widget _buildHeader() {
    return LEHeader(
      identifier: 'Messages',
      identifierAvatarImage: AssetImage('assets/2.jpeg'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildHeader();
  }
}