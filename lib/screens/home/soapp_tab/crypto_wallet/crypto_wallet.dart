import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:soapp/utils/colors.dart';
import 'package:soapp/widgets/base_stateless_widget.dart';

class CryptoWalletScreen extends BaseStatelessWidget {
  const CryptoWalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: primary,
          leading: IconButton(
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(getString(context)?.crypto_wallet ?? ''),
          // actions: [
          //   IconButton(
          //     tooltip: localization.starterAppTooltipFavorite,
          //     icon: const Icon(
          //       Icons.favorite,
          //     ),
          //     onPressed: () {},
          //   ),
          //   IconButton(
          //     tooltip: localization.starterAppTooltipSearch,
          //     icon: const Icon(
          //       Icons.search,
          //     ),
          //     onPressed: () {},
          //   ),
          //   PopupMenuButton<Text>(
          //     itemBuilder: (context) {
          //       return [
          //         PopupMenuItem(
          //           child: Text(
          //             localization.demoNavigationRailFirst,
          //           ),
          //         ),
          //         PopupMenuItem(
          //           child: Text(
          //             localization.demoNavigationRailSecond,
          //           ),
          //         ),
          //         PopupMenuItem(
          //           child: Text(
          //             localization.demoNavigationRailThird,
          //           ),
          //         ),
          //       ];
          //     },
          //   )
          // ],
        ),
        body: SafeArea(
            child: Center(
          child: Text('Crypto Wallet'),
        )));
  }
}
