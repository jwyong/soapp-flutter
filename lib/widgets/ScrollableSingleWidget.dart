import 'package:flutter/material.dart';
import 'package:soapp/widgets/BaseStatelessWidget.dart';

class ScrollableSingleWidget extends BaseStatelessWidget {
  final Widget child;
  final EdgeInsets? padding;

  const ScrollableSingleWidget({Key? key, required this.child, this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: () {
      FocusScope.of(context).requestFocus(FocusNode());
    },
        // child: SafeArea(
        child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
      return SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraints.maxHeight),
          child: IntrinsicHeight(
              child: Padding(
            padding: padding ??
                const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
            child: child,
          )),
        ),
      );
    })
        // ),
        );
  }
}
