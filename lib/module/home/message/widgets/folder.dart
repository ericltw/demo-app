import 'package:layerkit/layerkit.dart';

class Folder extends StatelessWidget {
  Widget _buildFolder() {
    return LEFolder(
      identifier: 'All',
      identifierAvatars: [
        AssetImage('assets/1.jpeg'),
        AssetImage('assets/2.jpeg'),
        AssetImage('assets/3.jpeg'),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildFolder();
  }
}
