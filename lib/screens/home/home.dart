import 'package:flutter/material.dart';
import 'package:move_to_background/move_to_background.dart';
import 'package:provider/provider.dart';
import 'package:soapp/screens/home/home_vm.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../utils/routes.dart';
import '../../widgets/asset_img_png.dart';
import '../../widgets/base_stateless_widget.dart';

// TODO: do proper tabs after done crypto wallet
class HomeScreen extends BaseStatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeVM vm = Provider.of(context, listen: false);

    var bottomNavigationBarItems = <BottomNavigationBarItem>[
      // soapp (home)
      const BottomNavigationBarItem(
        icon: AssetImgPngWidget('ic_soapp_1', width: 20),
        label: soapp,
      ),

      // discover (restaurants)
      BottomNavigationBarItem(
        icon: const AssetImgPngWidget('ic_discover_0', width: 20),
        label: getString(context)?.discover,
      ),

      // chat
      BottomNavigationBarItem(
        icon: const AssetImgPngWidget('ic_chat_0', width: 20),
        label: getString(context)?.chat,
      ),

      // appt
      BottomNavigationBarItem(
        icon: const AssetImgPngWidget('ic_discover_0', width: 20),
        label: getString(context)?.discover,
      ),

      // profile
      BottomNavigationBarItem(
        icon: const AssetImgPngWidget('ic_profile_0', width: 20),
        label: getString(context)?.profile,
      ),
    ];

    return WillPopScope(
        child: Scaffold(
          body: const SafeArea(child: Center(child: Text("Home"))),
          bottomNavigationBar:
              // _BottomAppBar(),
              BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: bottomNavigationBarItems,
            // currentIndex: _currentIndex.value,
            type: BottomNavigationBarType.fixed,
            // selectedFontSize: textTheme.caption!.fontSize!,
            // unselectedFontSize: textTheme.caption!.fontSize!,
            onTap: (index) {
              // setState(() {
              //   _currentIndex.value = index;
              // });
            },
            // selectedItemColor: colorScheme.onPrimary,
            // unselectedItemColor: colorScheme.onPrimary.withOpacity(0.38),
            backgroundColor: grey1,
          ),
          floatingActionButton: FloatingActionButton(
              backgroundColor: primary,
              onPressed: () {
                vm.checkAndGoToCryptoWalletScreen(context);
              },
              // tooltip: localizations.buttonTextCreate,
              child: const Icon(Icons.wallet)),
        ),
        onWillPop: () async {
          MoveToBackground.moveTaskToBack();
          return false;
        });
  }
}

class _BottomAppBar extends StatelessWidget {
  // const _BottomAppBar({this.shape,});

  // final NotchedShape? shape;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      color: grey1,
      child: IconTheme(
        data: IconThemeData(color: primary),
        child: Row(
          children: [
            test(),
            test(),
            Expanded(child: SizedBox()),
            test(),
            test(),
          ],
        ),
      ),
    );
  }

  Widget test() => Expanded(
          child: IconButton(
        // tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        icon: const Icon(Icons.menu),
        onPressed: () {},
      ));
}
