import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../utils/routes.dart';
import '../../../../../widgets/base_stateless_widget.dart';
import '../../../../../widgets/button_widget.dart';

import '../crypto_wallet_vm.dart';

class WalletListScreen extends BaseStatelessWidget {
  const WalletListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CryptoWalletVM sharedVM = Provider.of(context, listen: false);

    return ListView(
      children: [
        ButtonWidget(getString(context)?.eth_wallet, () {
          Navigator.pushNamed(context, routeEthWallet);
        })
      ],
    );
  }
}
