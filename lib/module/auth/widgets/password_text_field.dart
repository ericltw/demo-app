import 'package:layerkit/layerkit.dart';

class PasswordTextField extends StatelessWidget {
  Widget _buildPasswordTextField() {
    return LETextField(
      placeholder: 'Password',
      obscureText: true,
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return _buildPasswordTextField();
  }
}