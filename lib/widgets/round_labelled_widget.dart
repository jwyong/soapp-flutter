import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:soapp/utils/colors.dart';
import 'package:soapp/utils/constants.dart';

class RoundLabelledWidget extends StatelessWidget {
  const RoundLabelledWidget(this.title,
      {super.key,
      required this.width,
      required this.color,
      this.imageName,
      this.onTap,
      this.isFirstItem = false});

  final String? title;
  final double width;
  final String? imageName;
  final Color color;
  final void Function()? onTap;
  final bool isFirstItem;

  @override
  Widget build(BuildContext context) => InkWell(
      onTap: onTap,
      child: Padding(
          padding: isFirstItem
              ? const EdgeInsets.only(right: 5)
              : const EdgeInsets.symmetric(horizontal: 5),
          child: Container(
              width: width,
              height: width,
              decoration: BoxDecoration(
                  image: imageName == null
                      ? null
                      : DecorationImage(
                          image: AssetImage('$assetsImg/$imageName.png')),
                  color: color,
                  borderRadius: BorderRadius.circular(width / 2)),
              child: Center(child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(title?.toUpperCase() ?? '',
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                  fontFamily: fontQuicksandBold,
                                  letterSpacing: 2,
                                  color: white)))))));
}
