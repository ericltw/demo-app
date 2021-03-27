import 'package:layerkit/layerkit.dart';

import './module/home/home_view.dart';
// import './module/auth/auth_view.dart';

void main() {
  runApp(
    LEApp(
      home: _Home(),
    ),
  );
}

class _Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<_Home> {
  Widget _buildHome() {
    return HomeView();
  }
  
  @override
  Widget build(BuildContext context) {
    return _buildHome();
  }
}
