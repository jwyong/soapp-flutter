import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:soapp/utils/constants.dart';
import 'package:soapp/widgets/BaseStatelessWidget.dart';

class TextWidget extends BaseStatelessWidget {
  final String? text;
  final double? fontSize;

  const TextWidget(this.text, this.fontSize, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text ?? "",
        style: TextStyle(
            fontSize: respSP(fontSize ?? 12), fontFamily: fontQuicksandBook));
  }
}
