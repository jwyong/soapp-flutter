import 'package:flutter/cupertino.dart';
import 'package:soapp/screens/base_vm.dart';
import 'package:soapp/utils/constants.dart';
import 'package:soapp/utils/routes.dart';

class HomeVM extends BaseVM {
  // TODO: do proper sp seperation navigation
  void checkAndGoToCryptoWalletScreen(BuildContext context) {
    getSpStringFuture(spKeyCryptoPubKey).then((String? value) =>
        value?.isNotEmpty == true
            ? navigateTo(context, routeCryptoWallet)
            : navigateTo(context, routeRecovery));
  }
}
