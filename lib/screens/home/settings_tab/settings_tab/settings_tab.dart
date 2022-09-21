import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:soapp/widgets/base_stateless_widget.dart';

class SettingsTabScreen extends BaseStatelessWidget {
  const SettingsTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: Center(child: Text("SettingsTabScreen")));
  }
}