import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:soapp/utils/colors.dart';
import 'package:soapp/widgets/base_stateless_widget.dart';

class ChatTabScreen extends BaseStatelessWidget {
  const ChatTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("chat tab"),
          backgroundColor: Colors.transparent,
        ),
        body: SafeArea(
            child: Container(color: primaryLight4, child: Text("Chat List"))));
  }
}
