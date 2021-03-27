import 'package:flutter/widgets.dart';
import 'package:layerkit/layerkit.dart';

import './demo_event_state.dart';
import './model/demo_event.dart';
import './model/demo_state.dart';
import '../../core/event_state/event_state_builder.dart';

class DemoView extends StatefulWidget {
  @override
  _DemoViewState createState() => _DemoViewState();
}

class _DemoViewState extends State<DemoView> {
  DemoEventState _demoEventState;

  void _initDemoEventState() {
    _demoEventState = DemoEventState();
    _demoEventState.init();
  }
  
  @override
  void initState() {
    super.initState();
    _initDemoEventState();
  }

  void _disposeDemoEventState() {
    _demoEventState?.dispose();
  }

  @override
  void dispose() {
    _disposeDemoEventState();
    super.dispose();
  }

  Widget _buildCount() {
    return EventStateBuilder(
      state: _demoEventState.state,
      builder: (BuildContext context, DemoState state) {
        return Text('${state.count}');
      },
    );
  }

  void _onTapAddButton() {
    _demoEventState.emitEvent(
      AddCountEvent(),
    );
  }

  Widget _buildAddButton() {
    return LETextButton(
      text: 'Add',
      color: Color(0xFF000000),
      size: TextButtonSize.large,
      onTap: _onTapAddButton,
    );
  }

  void _onTapMinusButton() {
    _demoEventState.emitEvent(
      MinusCountEvent(),
    );
  }

  Widget _buildMinusButton() {
    return LETextButton(
      text: 'Minus',
      color: Color(0xFF000000),
      size: TextButtonSize.large,
      onTap: _onTapMinusButton,
    );
  }

  
  Widget _buildDemoView() {
    List<Widget> children = [];

    children.add(_buildCount());
    children.add(_buildAddButton());
    children.add(_buildMinusButton());

    return LEScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: children,
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return _buildDemoView();
  }
}