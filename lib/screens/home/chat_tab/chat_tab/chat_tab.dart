import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:soapp/utils/colors.dart';
import 'package:soapp/utils/constants.dart';
import 'package:soapp/widgets/base_stateless_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChatTabScreen extends BaseStatelessWidget {
  const ChatTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations? appLoc = getString(context);
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double paddingHori = 0.1 * screenWidth;

    return Scaffold(
        backgroundColor: primaryDark2,
        appBar: AppBar(
          backgroundColor: primaryDark2,
          elevation: 0,
          centerTitle: true,
          title: Image.asset(
            '$assetsLogo/words_white.png',
            width: 90,
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Image.asset(
                  '$assetsImg/ic_toolbar_search_black.png',
                  color: Colors.white,
                  width: 23,
                ))
          ],
        ),
        body: SafeArea(
            child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius:
                  BorderRadius.only(topLeft: Radius.circular(paddingHori))),
          child: Padding(
            padding: EdgeInsets.only(
                left: paddingHori,
                right: paddingHori,
                top: 0.01419 * screenHeight),
            child: Text("chat list"),
          ),
        )));
  }
}
