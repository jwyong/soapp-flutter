import 'package:flutter/material.dart';
import 'package:soapp/utils/colors.dart';
import 'package:soapp/utils/dimensions.dart';
import 'package:soapp/widgets/BaseStatelessWidget.dart';

class ButtonWidget extends BaseStatelessWidget {
  final String? label;
  final VoidCallback? onPressed;

  final double? width;
  final bool? isBtnEnabled;

  const ButtonWidget(this.label, this.onPressed,
      {Key? key, this.isBtnEnabled, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint("JAY_LOG: ButtonWidget, build, ");

    return SizedBox(
      width: width ?? respWidthPercent(100),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: primary,
            onPrimary: primary,
            onSurface: primary,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(respWidth(formRadius))),
          ),
          onPressed: onPressed,

          // disabledTextColor: MyColours.white50a,
          // disabledColor: MyColours.primaryDark1,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: respHeight(15)),
            child: Text(
              label ?? "",
              style: TextStyle(color: Colors.white, fontSize: respSP(18)),
            ),
          )),
    );
  }
}
