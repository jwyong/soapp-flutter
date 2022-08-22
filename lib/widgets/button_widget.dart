import 'package:flutter/material.dart';
import 'package:soapp/utils/colors.dart';
import 'package:soapp/utils/constants.dart';
import 'package:soapp/utils/dimensions.dart';
import 'package:soapp/widgets/base_stateless_widget.dart';

class ButtonWidget extends BaseStatelessWidget {
  const ButtonWidget(this.label, this.onPressed,
      {Key? key, this.isBtnEnabled, this.widthFactor})
      : super(key: key);

  final String? label;
  final VoidCallback? onPressed;
  final double? widthFactor;
  final bool? isBtnEnabled;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: widthFactor ?? 1,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: primary,
            disabledBackgroundColor: primaryDark1,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(formRadius)),
          ),
          onPressed: onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Text(label?.toUpperCase() ?? "",
                style: getStyle(context)
                    .bodyLarge
                    ?.apply(color: white, fontFamily: fontQuicksandBold)),
          )),
    );
  }
}
