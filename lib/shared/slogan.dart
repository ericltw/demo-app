import 'package:layerkit/layerkit.dart';

TextStyle _getTextStyle(BuildContext context) {
  LEThemeData themeData = LETheme.of(context);

  return themeData.typography.head.apply(
    color: Color(0xFFC1C1C1),
  );
}

class Slogan extends StatelessWidget {
  Widget _buildSlogan(BuildContext context) {
    return Text(
      'Discover and collaborate, for you.',
      style: _getTextStyle(context),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return _buildSlogan(context);
  }
}