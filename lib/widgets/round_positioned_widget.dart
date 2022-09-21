import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:soapp/utils/colors.dart';
import 'package:soapp/utils/constants.dart';

class RoundPositionedWidget extends StatelessWidget {
  const RoundPositionedWidget(this.color,
      {super.key,
      this.title,
      this.desc,
      required this.width,
      required this.top,
      required this.left,
      this.height,
      this.onTap,
      this.isSubtitleGreen = false});

  final double width, top, left;
  final double? height;
  final Color color;
  final String? title, desc;
  final bool isSubtitleGreen;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) => Positioned(
      top: top,
      left: left,
      child: InkWell(
          onTap: onTap,
          child: Container(
              width: width,
              height: height ?? width,
              decoration: BoxDecoration(
                  color: color, borderRadius: BorderRadius.circular(width / 2)),
              child: title != null
                  ? Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(title?.toUpperCase() ?? '',
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(
                                    fontFamily: fontQuicksandBold,
                                    letterSpacing: 2)),
                        Text(desc ?? '',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                    fontFamily: fontQuicksandBook, height: 1.3)
                                .apply(
                                    fontSizeFactor: 0.85,
                                    color: isSubtitleGreen
                                        ? primaryDark5
                                        : grey10))
                      ],
                    )
                  : null)));
}
