import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class BaseStatelessWidget extends StatelessWidget with BaseFunctions {
  const BaseStatelessWidget({ Key? key }) : super(key: key);
}

mixin BaseFunctions on StatelessWidget { // you can also constrain the mixin to specific classes using on in this line.
  // get localised string based on string name
  AppLocalizations? getString(BuildContext context) {
    // Add web view logic here. We can add variables to the mixin itself as well.
    return AppLocalizations.of(context);
  }

  ///
  /// responsive screen util
  ///
  double respWidth(double width) {
    return ScreenUtil().setWidth(width);
  }

  double respHeight(double height) {
    return ScreenUtil().setHeight(height);
  }

  double respSP(double sp) {
    return ScreenUtil().setSp(sp);
  }

  double respWidthPercent(double percent) {
    return ScreenUtil().screenWidth * (percent/100);
  }

  double respHeightPercent(double percent) {
    return ScreenUtil().screenHeight * (percent/100);
  }
}