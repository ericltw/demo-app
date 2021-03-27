import 'package:layerkit/layerkit.dart';

TextStyle _getTextStyle(BuildContext context) {
  LEThemeData themeData = LETheme.of(context);

  return themeData.typography.h4.apply(
    color: themeData.style.contentHeavy,
  );
}

class Logo extends StatelessWidget {
  Widget _buildLogo(BuildContext context) {
    return Text(
      'Searcle',
      style: _getTextStyle(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildLogo(context);
  }
}