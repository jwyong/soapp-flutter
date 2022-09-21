import 'package:flutter/material.dart';

import '../utils/constants.dart';

class AssetImgPngWidget extends StatelessWidget {
  const AssetImgPngWidget(this.imgName, {super.key, this.width, this.height});

  final String imgName;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Image(
      gaplessPlayback: true,
      image: AssetImage("$assetsImg/$imgName.png"),
      width: width,
      height: height,
    );
  }
}

class AssetLogoPngWidget extends StatelessWidget {
  const AssetLogoPngWidget(this.logoName, {super.key, this.width, this.height});

  final String logoName;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage("$assetsLogo/$logoName.png"),
      width: width,
      height: height,
    );
  }
}
