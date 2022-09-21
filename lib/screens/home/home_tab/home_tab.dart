import 'package:flutter/material.dart';
import 'package:soapp/utils/colors.dart';
import 'package:soapp/utils/constants.dart';
import 'package:soapp/utils/routes.dart';
import 'package:soapp/widgets/base_stateless_widget.dart';
import 'package:soapp/widgets/round_positioned_widget.dart';

class HomeTabScreen extends BaseStatelessWidget {
  const HomeTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,

          // TODO: TEMP - no actions for now
          // actions: [
          //   IconButton(
          //       onPressed: () {},
          //       icon: Image.asset(
          //         '$assetsImg/ic_toolbar_search_black.png',
          //         width: 23,
          //       ))
          // ],
          elevation: 0,
          centerTitle: true,
          title: Text(
            getString(context)?.home.toUpperCase() ?? '',
            style: getStyle(context)
                .titleMedium
                ?.copyWith(fontFamily: fontQuicksandBold, letterSpacing: 3),
          ),
        ),
        body: SafeArea(
            child: Stack(children: [
          /// circles - width = 400, height = 708
          // settings
          RoundPositionedWidget(grey3,
              title: getString(context)?.settings,
              desc: getString(context)?.settings_desc,
              width: 0.285 * screenWidth,
              top: 0.07627 * screenHeight,
              left: 0.2225 * screenWidth),

          // crypto wallet
          RoundPositionedWidget(grey2,
              title: getString(context)?.crypto_wallet,
              desc: getString(context)?.crypto_wallet_desc,
              width: 0.4075 * screenWidth,
              top: 0.0254 * screenHeight,
              left: 0.5375 * screenWidth, onTap: () {
            Navigator.pushNamed(context, routeCryptoWallet);
          }),

          // contact
          RoundPositionedWidget(grey3,
              title: getString(context)?.contact,
              desc: getString(context)?.contact_desc,
              width: 0.5825 * screenWidth,
              top: 0.2542 * screenHeight,
              left: -0.0525 * screenWidth),

          // profile
          RoundPositionedWidget(grey2,
              title: getString(context)?.profile,
              desc: getString(context)?.profile_desc,
              width: 0.325 * screenWidth,
              top: 0.274 * screenHeight,
              left: 0.5725 * screenWidth),

          // favourite
          RoundPositionedWidget(grey2,
              title: getString(context)?.favourite,
              desc: getString(context)?.favourite_desc,
              width: 0.345 * screenWidth,
              top: 0.6003 * screenHeight,
              left: 0.0475 * screenWidth),

          // schedule
          RoundPositionedWidget(primaryLight1,
              title: getString(context)?.schedule,
              desc: getString(context)?.schedule_desc,
              width: 0.625 * screenWidth,
              top: 0.4675 * screenHeight,
              left: 0.4175 * screenWidth,
              isSubtitleGreen: true),

          // green 1
          RoundPositionedWidget(primaryDark1,
              width: 0.2125 * screenWidth,
              top: 0.1342 * screenHeight,
              left: -0.0175 * screenWidth),

          // green 2
          RoundPositionedWidget(primaryLight1,
              width: 0.125 * screenWidth,
              top: 0.2288 * screenHeight,
              left: 0.465 * screenWidth),

          // green 3
          RoundPositionedWidget(primaryPale2,
              width: 0.195 * screenWidth,
              top: 0.2218 * screenHeight,
              left: 0.8725 * screenWidth),

          // grey 4
          RoundPositionedWidget(grey8,
              width: 0.32 * screenWidth,
              top: 0.335 * screenHeight,
              left: 0.925 * screenWidth),

          // green 5
          RoundPositionedWidget(primaryPale2,
              width: 0.195 * screenWidth,
              top: 0.5467 * screenHeight,
              left: -0.1175 * screenWidth),

          // green 6
          RoundPositionedWidget(primaryPale2,
              width: 0.195 * screenWidth,
              top: 0.7655 * screenHeight,
              left: 0.3275 * screenWidth),
        ])));
  }
}
