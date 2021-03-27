import 'package:layerkit/layerkit.dart';

TextStyle _getTextStyle(BuildContext context) {
  LEThemeData themeData = LETheme.of(context);

  return themeData.typography.head.apply(
    color: themeData.style.contentHeavy,
  );
}

class PhoneTextField extends StatelessWidget {
  Widget _buildPrefix(BuildContext context) {
    return Text(
      '+886',
      style: _getTextStyle(context),
    );
  }

  Widget _buildPhoneTextField(BuildContext context) {
    return LETextField(
      prefix: _buildPrefix(context),
      placeholder: 'Phone',
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildPhoneTextField(context);
  }
}