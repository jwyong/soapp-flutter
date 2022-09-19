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
              actions: [
                IconButton(
                    onPressed: () {
                      vm.encSP.remove(spKeyCryptoPrivKey).then((value) {
                        vm.finish(context);
                      });
                    },
                    icon: const Icon(Icons.refresh))
              ],
              title: Text(getString(context)?.crypto_wallet ?? ''),
            ),
            body: SafeArea(
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 20),
                    child: MultiProvider(
                      providers: [ChangeNotifierProvider.value(value: vm)],
                      child: FutureBuilder(
                        builder: (ctx, snapshot) {
                          // Displaying LoadingSpinner to indicate waiting state
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            return _CryptoWalletNavigator(
                                vm, snapshot.data?.toString());
                          }

                          return const SizedBox.shrink();
                        },

                        // Future that needs to be resolved
                        // inorder to display something on the Canvas
                        future: vm.getSpStringFuture(spKeyCryptoPrivKey),
                      ),
                    )))),
        onWillPop: () async =>
            await vm.navigatorKey.currentState?.maybePop() != true);
  }
}

class _CryptoWalletNavigator extends StatelessWidget {
  const _CryptoWalletNavigator(this.vm, this.spPrivateKey);

  final CryptoWalletVM vm;
  final String? spPrivateKey;

  // final Object? spPrivateKey;

  @override
  Widget build(BuildContext context) {
    return Navigator(
        key: vm.navigatorKey,
        initialRoute: spPrivateKey?.isNotEmpty == true ? '' : routeRecovery,
        onGenerateRoute: (RouteSettings settings) {
          WidgetBuilder builder;

          switch (settings.name) {
            // recovery
            case routeRecovery:
              builder = (BuildContext context) => ChangeNotifierProvider.value(
                  value: RecoveryVM(), child: const RecoveryScreen());
              break;

            // eth wallet
            case routeEthWallet:
              builder = (BuildContext context) => ChangeNotifierProvider.value(
                  value: EthWalletVM(), child: const EthWalletScreen());
              break;

            // main page - wallet list
            default:
              builder = (BuildContext context) => const WalletListScreen();
              break;
          }

          return MaterialPageRoute<void>(builder: builder, settings: settings);
        });
  }
}
