import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:soapp/screens/home/soapp_tab/crypto_wallet/crypto_wallet_vm.dart';
import 'package:soapp/screens/home/soapp_tab/crypto_wallet/eth/eth_wallet_vm.dart';
import 'package:soapp/screens/home/soapp_tab/crypto_wallet/recovery/recovery.dart';
import 'package:soapp/screens/home/soapp_tab/crypto_wallet/recovery/recovery_vm.dart';
import 'package:soapp/screens/home/soapp_tab/crypto_wallet/wallet_list/wallet_list.dart';
import 'package:soapp/utils/constants.dart';
import 'package:soapp/utils/routes.dart';

import '../../../../utils/colors.dart';
import '../../../../widgets/base_stateless_widget.dart';
import '../../../../widgets/button_widget.dart';
import '../../../../widgets/clearable_field_widget.dart';
import 'eth/eth_wallet.dart';

class CryptoWalletScreen extends BaseStatelessWidget {
  const CryptoWalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CryptoWalletVM vm = Provider.of(context);

    return WillPopScope(
        child: Scaffold(
            // TODO: globalise appbar?
            appBar: AppBar(
              backgroundColor: primary,
              leading: IconButton(
                tooltip: MaterialLocalizations.of(context).backButtonTooltip,
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.maybePop(context);
                },
              ),
              title: Text(getString(context)?.crypto_wallet ?? ''),
            ),
            body: SafeArea(
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 20),
                    child: MultiProvider(
                        providers: [ChangeNotifierProvider.value(value: vm)],
                        child: Navigator(
                            key: vm.navigatorKey,
                            onGenerateRoute: (RouteSettings settings) {
                              WidgetBuilder builder;
                              switch (settings.name) {
                                case routeRecovery:
                                  builder = (BuildContext context) =>
                                      ChangeNotifierProvider.value(
                                          value: RecoveryVM(),
                                          child: const RecoveryScreen());
                                  break;

                                case routeEthWallet:
                                  builder = (BuildContext context) =>
                                      ChangeNotifierProvider.value(
                                          value: EthWalletVM(),
                                          child: const EthWalletScreen());
                                  break;

                                default:
                                  builder = (BuildContext context) =>
                                      const WalletListScreen();
                                  break;
                              }
                              return MaterialPageRoute<void>(
                                  builder: builder, settings: settings);
                            }))))),
        onWillPop: () async =>
            await vm.navigatorKey.currentState?.maybePop() != true);
  }
}
