import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:soapp/widgets/BaseStatelessWidget.dart';

class ExpandedWidget extends BaseStatelessWidget {
  final int flex;
  final double minHeight;

  const ExpandedWidget(this.flex, this.minHeight, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: SizedBox(
        height: respHeight(minHeight),
      ),
    );
  }
}
