import 'package:layerkit/layerkit.dart';

class EmailTextField extends StatelessWidget {
  Widget _buildPrefix() {
    return Icon(
      LEIcons.email_outline,
      color:  Color(0xFF222222),
      size: 20.0,
    );
  }
  
  Widget _buildEmailTextField() {
    return LETextField(
      prefix: _buildPrefix(),
      placeholder: 'Email',
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return _buildEmailTextField();
  }
}