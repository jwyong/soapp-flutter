import 'package:flutter/material.dart';
import 'package:soapp/utils/colors.dart';
import 'package:soapp/widgets/BaseStatelessWidget.dart';

class RegCircleBg extends BaseStatelessWidget {
  final Scaffold scaffold;

  const RegCircleBg({required this.scaffold});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // white bg
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(color: white),
        ),

        // circles bg
        bgCircles(
          left: -10,
          top: -respWidthPercent(60) / 2,
          width: respHeightPercent(36),
          height: respHeightPercent(36),
          color: primaryDark2,
        ),

        bgCircles(
          top: respHeightPercent(3),
          left: -respWidthPercent(38) * 0.35,
          width: respWidthPercent(38),
          height: respWidthPercent(38),
          color: grey3,
        ),

        bgCircles(
          color: grey8,
          btm: -respWidthPercent(62) / 2,
          left: -10,
          width: respWidthPercent(62),
          height: respWidthPercent(62),
        ),

        bgCircles(
          color: primaryPale2,
          btm: respHeightPercent(4),
          left: -respWidthPercent(53) * 0.35,
          width: respWidthPercent(53),
          height: respWidthPercent(53),
        ),

        // main content
        scaffold
      ],
    );
  }

  Widget bgCircles(
      {double? width,
      double? height,
      Color? color,
      double? top,
      double? left,
      double? btm}) {
    return Positioned(
      top: top,
      left: left,
      bottom: btm,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(width ?? 1 / 2)),
      ),
    );
  }
}
