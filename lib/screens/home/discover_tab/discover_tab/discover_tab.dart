import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:soapp/widgets/base_stateless_widget.dart';

class DiscoverTabScreen extends BaseStatelessWidget {
  const DiscoverTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: Center(child: Text("DiscoverTabScreen")));
  }
}