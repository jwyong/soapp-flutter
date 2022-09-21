import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:move_to_background/move_to_background.dart';
import 'package:provider/provider.dart';
import 'package:soapp/screens/home/appt_tab/appt_tab/appt_tab.dart';
import 'package:soapp/screens/home/chat_tab/chat_tab/chat_tab.dart';
import 'package:soapp/screens/home/discover_tab/discover_tab/discover_tab.dart';
import 'package:soapp/screens/home/home_tab/home_tab.dart';
import 'package:soapp/screens/home/home_vm.dart';
import 'package:soapp/screens/home/settings_tab/settings_tab/settings_tab.dart';

import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../utils/routes.dart';
import '../../widgets/asset_img_png.dart';
import '../../widgets/base_stateless_widget.dart';

// TODO: do proper tabs after done crypto wallet
class HomeScreen extends BaseStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late HomeVM vm;

  @override
  void initState() {
    vm = Provider.of(context, listen: false);
    vm.homeTabController =
        TabController(length: 5, initialIndex: 0, vsync: this);
    vm.init();

    super.initState();
  }

  @override
  void dispose() {
    vm.homeTabController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => WillPopScope(
      child: Scaffold(
        body: TabBarView(
          controller: vm.homeTabController,
          children: const [
            HomeTabScreen(),
            DiscoverTabScreen(),
            ChatTabScreen(),
            ApptTabScreen(),
            SettingsTabScreen()
          ],
        ),
        bottomNavigationBar: Consumer<HomeVM>(
            // TODO: re-enable consumer vm val once done test
            builder: (context, _, __) => BottomNavigationBar(
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  items: getHomeTabItems(widget.getString(context)),
                  currentIndex: vm.homeTabController.index,
                  type: BottomNavigationBarType.fixed,
                  // selectedFontSize: textTheme.caption!.fontSize!,
                  // unselectedFontSize: textTheme.caption!.fontSize!,
                  onTap: vm.tapBarItemOnClick,
                  // selectedItemColor: colorScheme.onPrimary,
                  // unselectedItemColor: colorScheme.onPrimary.withOpacity(0.38),
                  backgroundColor: grey1,
                )),
      ),
      onWillPop: () async {
        MoveToBackground.moveTaskToBack();
        return false;
      });

  // list of home tab items
  List<BottomNavigationBarItem> getHomeTabItems(AppLocalizations? appLoc) =>
      <BottomNavigationBarItem>[
        // soapp (home)
        const BottomNavigationBarItem(
          activeIcon: AssetImgPngWidget('ic_home_1', width: 20),
          icon: AssetImgPngWidget('ic_home_0', width: 20),
          label: soapp,
        ),

        // discover (restaurants)
        BottomNavigationBarItem(
          activeIcon: const AssetImgPngWidget('ic_discover_1', width: 20),
          icon: const AssetImgPngWidget('ic_discover_0', width: 20),
          label: appLoc?.discover,
        ),

        // chat
        BottomNavigationBarItem(
          activeIcon: const AssetImgPngWidget('ic_chat_1', width: 20),
          icon: const AssetImgPngWidget('ic_chat_0', width: 20),
          label: appLoc?.chat,
        ),

        // appt
        BottomNavigationBarItem(
          activeIcon: const AssetImgPngWidget('ic_appt_1', width: 20),
          icon: const AssetImgPngWidget('ic_appt_0', width: 20),
          label: appLoc?.discover,
        ),

        // profile
        BottomNavigationBarItem(
          activeIcon: const AssetImgPngWidget('ic_profile_1', width: 20),
          icon: const AssetImgPngWidget('ic_profile_0', width: 20),
          label: appLoc?.profile,
        ),
      ];
}
