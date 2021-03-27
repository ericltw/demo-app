import 'package:layerkit/layerkit.dart';

class BottomNavigation extends StatelessWidget {
  Widget _buildBackButton() {
    return LETextButton(
      size: TextButtonSize.small,
      color: Color(0xFF007AFF),
      text: 'Back',
      prefixIcon: LEIcons.arrow_ios_back_outline,
      onTap: () {},
    );
  }

  Widget _buildNextButton() {
    return LETextButton(
      size: TextButtonSize.large,
      color: Color(0xFFFFFFFF),
      text: 'Next',
      suffixIcon: LEIcons.arrow_ios_forward_outline,
      onTap: () {},
    );
  }

  Widget _buildBottomNavigation() {
    return LEBottomNavigation(
      backButton: _buildBackButton(),
      forwardButton: _buildNextButton(),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return _buildBottomNavigation();
  }
}