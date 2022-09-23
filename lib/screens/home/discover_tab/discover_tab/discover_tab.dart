import 'package:flutter/material.dart';
import 'package:soapp/models/discover/restaurant.dart';
import 'package:soapp/utils/colors.dart';
import 'package:soapp/utils/ui_functions.dart';
import 'package:soapp/widgets/asset_img_png.dart';
import 'package:soapp/widgets/base_stateless_widget.dart';
import 'package:soapp/widgets/padded_chip.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:soapp/widgets/round_labelled_widget.dart';
import 'package:soapp/widgets/round_positioned_widget.dart';

import '../../../../utils/constants.dart';

class DiscoverTabScreen extends BaseStatelessWidget {
  const DiscoverTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations? appLoc = getString(context);
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    double btmCirclesWidth = 0.1624 * screenHeight;
    double startingMargin = 0.225 * screenWidth;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            getString(context)?.discover.toUpperCase() ?? '',
            style: getStyle(context).titleMedium?.copyWith(
                fontFamily: fontQuicksandBold,
                letterSpacing: 3,
                color: primaryLight3),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Image.asset(
                  '$assetsImg/ic_toolbar_search_black.png',
                  color: primaryLight3,
                  width: 23,
                ))
          ],
        ),
        body: SafeArea(
            child: Stack(children: [
          // green circle
          RoundPositionedWidget(primaryLight3,
              width: 0.705 * screenWidth,
              top: 0.329 * screenHeight,
              left: -0.1925 * screenWidth),

          // main items
          Column(children: [
            // cuisine chips list
            SingleChildScrollView(
              //PageScrollPhysics
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(children: [
                  SizedBox(width: startingMargin),
                  PaddedChipWidget(appLoc?.coffee,
                      isFirstItem: true, bgColour: grey2),
                  PaddedChipWidget(appLoc?.dessert, bgColour: grey2),
                  PaddedChipWidget(appLoc?.vegetarian, bgColour: grey4),
                  PaddedChipWidget(appLoc?.local, bgColour: grey4),
                  PaddedChipWidget(appLoc?.western, bgColour: grey6),
                  PaddedChipWidget(appLoc?.fast_food, bgColour: grey6),
                  PaddedChipWidget(appLoc?.asian, bgColour: grey8)
                ])),

            const SizedBox(height: 10),

            // restaurants
            Expanded(
                child: _RestaurantListView(
                    screenWidth: screenWidth, startingMargin: startingMargin)),

            const SizedBox(height: 20),

            // restaurant locations
            SizedBox(
                height: btmCirclesWidth,
                child: ListView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: [
                      SizedBox(width: startingMargin),
                      RoundLabelledWidget(appLoc?.nearby,
                          width: btmCirclesWidth, color: primaryDark3),
                      RoundLabelledWidget(appLoc?.popular,
                          width: btmCirclesWidth, color: primaryLight3),
                      RoundLabelledWidget('Desa Park City',
                          width: btmCirclesWidth, color: primaryDark5),
                      RoundLabelledWidget('Uptown',
                          width: btmCirclesWidth, color: primaryLight4),
                      RoundLabelledWidget('Sri Petaling',
                          width: btmCirclesWidth, color: primaryDark2),
                      RoundLabelledWidget('KLCC',
                          width: btmCirclesWidth, color: primaryLight2)
                    ])),

            const SizedBox(height: 10),
          ])
        ])));
  }
}

/// restaurant horizontal scrollable list view
class _RestaurantListView extends BaseStatelessWidget {
  const _RestaurantListView(
      {required this.screenWidth, required this.startingMargin});

  final double screenWidth, startingMargin;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      children: [
        // rotated "promotions" text
        SizedBox(
          width: startingMargin,
          child: RotatedBox(
            quarterTurns: -1,
            child: Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 12),
                    child: Text(
                        getString(context)?.promotions.toCapitalized() ?? '',
                        style: getStyle(context)
                            .titleLarge
                            ?.apply(fontFamily: fontQuicksandBold)))),
          ),
        ),

        // restaurant items
        _RestaurantItem(
            Restaurant('1', 'Mee Tarik Warisan Asli', 'Kota Damansara',
                'Chinese', 'img_mee_tarik', 30, false),
            width: 0.6575 * screenWidth,
            isFirstItem: true),
        _RestaurantItem(
            Restaurant('1', 'Mee Tarik Warisan Asli', 'Kota Damansara',
                'Chinese', 'img_mee_tarik', null, false),
            width: 0.6575 * screenWidth,
            isFirstItem: true),
        _RestaurantItem(
            Restaurant('1', 'Mee Tarik Warisan Asli', 'Kota Damansara',
                'Chinese', 'img_mee_tarik', 15, false),
            width: 0.6575 * screenWidth,
            isFirstItem: true),
      ],
    );
  }
}

/// restaurant item
class _RestaurantItem extends BaseStatelessWidget {
  const _RestaurantItem(this.restaurant,
      {required this.width, this.isFirstItem = false});

  final double width;
  final Restaurant restaurant;
  final bool isFirstItem;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    const double paddingHori = 10;

    return Padding(
        padding: isFirstItem
            ? const EdgeInsets.only(right: paddingHori)
            : const EdgeInsets.symmetric(horizontal: paddingHori),
        child: Column(mainAxisSize: MainAxisSize.max, children: [
          // upper section (img + favIcon + promo stack)
          Expanded(
              flex: 5,
              child: Container(
                  width: width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                              '$assetsImg/${restaurant.imageUrl}.png')),
                      borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(20))),
                  child: Stack(children: [
                    // favIcon TODO: functions - connect to room
                    Align(
                        alignment: AlignmentDirectional.topEnd,
                        child: IconButton(
                            onPressed: () {},
                            icon: const AssetImgPngWidget('ic_like_grey',
                                width: 22))),

                    // promo
                    if (restaurant.promotion != null)
                      Positioned(
                          right: 0,
                          bottom: 10,
                          child: Container(
                              decoration: const BoxDecoration(
                                  color: primaryLight3,
                                  borderRadius: BorderRadius.horizontal(
                                      left: Radius.circular(30))),
                              child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 5),
                                  child: Text(
                                    '${restaurant.promotion}%',
                                    style: getStyle(context)
                                        .titleLarge
                                        ?.apply(
                                            color: white,
                                            fontFamily: fontQuicksandBold),
                                  ))))
                  ]))),

          // lower section (restaurant info + btns)
          Expanded(
              flex: 2,
              child: Container(
                  width: width,
                  decoration: const BoxDecoration(
                      color: grey2,
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(20))),
                  child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 0.045 * screenWidth, vertical: 0.02128 * screenHeight),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // title
                            Text(
                              restaurant.name,
                              style: getStyle(context)
                                  .bodyLarge
                                  ?.apply(fontFamily: fontQuicksandBold),
                            ),

                            // location . cuisine
                            Text(
                              '${restaurant.location} · ${restaurant.cuisine}',
                              style: getStyle(context)
                                  .bodySmall
                                  ?.copyWith(height: 1.2),
                            ),

                            const Spacer(),

                            // btn row
                            Row(children: [
                              IconButton(
                                  padding: EdgeInsets.zero,
                                  constraints: const BoxConstraints(),
                                  onPressed: () {},
                                  icon: const AssetImgPngWidget('ic_share',
                                      width: 15)),
                              IconButton(
                                  padding: const EdgeInsets.symmetric(horizontal: 5),
                                  constraints: const BoxConstraints(),
                                  onPressed: () {},
                                  icon: const AssetImgPngWidget('ic_location',
                                      width: 15)),
                              IconButton(
                                  padding: EdgeInsets.zero,
                                  constraints: const BoxConstraints(),
                                  onPressed: () {},
                                  icon: const AssetImgPngWidget('ic_schedule',
                                      width: 15))
                            ])
                          ]))))
        ]));
  }
}
