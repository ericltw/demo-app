import 'package:layerkit/layerkit.dart';

import '../../shared/logo.dart';
import '../../shared/slogan.dart';
// import './widgets/email_text_field.dart';
import './widgets/phone_text_filed.dart';
import './widgets/password_text_field.dart';
import './widgets/bottom_navigation.dart';

class AuthView extends StatelessWidget {
  Widget _buildAuthView() {
    List<Widget> children = [];

    children.add(SizedBox(height: 200.0));
    children.add(Logo());
    children.add(SizedBox(height: 4.0));
    children.add(Slogan());
    children.add(SizedBox(height: 48.0));
    children.add(PhoneTextField());
    children.add(SizedBox(height: 20.0));
    children.add(PasswordTextField());
    children.add(Spacer());
    children.add(BottomNavigation());

    return LEScaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: children,
      ),
    );

  }

  @override
  Widget build(BuildContext context) {
    return _buildAuthView();
  }
}