import 'package:flutter/material.dart';
import 'package:soapp/widgets/base_stateless_widget.dart';

class ScrollableSingleWidget extends BaseStatelessWidget {
  const ScrollableSingleWidget({Key? key, required this.child, this.padding})
      : super(key: key);
  final Widget child;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: () {
      FocusScope.of(context).requestFocus(FocusNode());
    }, child: SafeArea(child: LayoutBuilder(
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
        ));
  }
}
