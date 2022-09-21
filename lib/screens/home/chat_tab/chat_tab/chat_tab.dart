import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:soapp/widgets/base_stateless_widget.dart';

class ChatTabScreen extends BaseStatelessWidget {
  const ChatTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: Center(child: Text("Chat List")));
  }
}