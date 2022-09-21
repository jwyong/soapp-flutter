import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:soapp/widgets/base_stateless_widget.dart';

class HomeTabScreen extends BaseStatelessWidget {
  const HomeTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: Center(child: Text("Home Tab")));
  }
}