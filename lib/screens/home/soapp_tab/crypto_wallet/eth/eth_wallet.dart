import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:soapp/screens/home/soapp_tab/crypto_wallet/crypto_wallet_vm.dart';

import '../../../../../widgets/base_stateless_widget.dart';
import '../../../../../widgets/button_widget.dart';
import '../../../../../widgets/clearable_field_widget.dart';
import 'eth_wallet_vm.dart';

class EthWalletScreen extends BaseStatelessWidget {
  const EthWalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final EthWalletVM vm = Provider.of(context, listen: false);
    vm.init();

    return ListView(children: [
      // title
      Text(
        getString(context)?.eth_wallet ?? '',
        style: getStyle(context).titleMedium,
      ),
      const SizedBox(height: 5),

      // public address
      Consumer<EthWalletVM>(builder: (context, vm, _) {
        return Column(children: [
          // qr
          QrImage(
            data: vm.publicAddress,
            version: QrVersions.auto,
            size: 200.0,
          ),

          Text(
            vm.publicAddress,
            style: getStyle(context).bodySmall,
            overflow: TextOverflow.ellipsis,
          )
        ]);
      }),
      const SizedBox(height: 10),

      // balance
      Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Consumer<EthWalletVM>(builder: (context, vm, _) {
          return Text(
            '${getString(context)?.balance}: ${vm.ethBalance}',
            style: getStyle(context).titleLarge,
          );
        }),
        IconButton(onPressed: vm.getBalance, icon: const Icon(Icons.refresh))
      ]),
      const SizedBox(height: 30),

      // send eth
      Row(children: [
        // title
        Text(
          getString(context)?.send_eth ?? '',
          style: getStyle(context).titleMedium,
        ),
        const SizedBox(width: 10),

        // send amount
        Expanded(
            child: ClearableFieldWidget(
          hintText: '0.2243',
          onChanged: vm.amountInputOnChange,
          textInputAction: TextInputAction.next,
        ))
      ]),
      const SizedBox(height: 10),

      // send eth address
      ClearableFieldWidget(
        controller: vm.sendAddressController,
        hintText: '0x3310C5da62a3C18Ab0c8e51359eD137c1A65712d',
        onChanged: vm.sendEthInputOnChange,
        suffixIcon: IconButton(
            tooltip: getString(context)?.paste_copied_text,
            onPressed: vm.pasteBtnOnClick,
            icon: const Icon(Icons.paste)),
      ),
      const SizedBox(height: 20),

      // gas estimate
      Row(children: [
        IconButton(
            onPressed: () {
              vm.estimateGas();
            },
            icon: const Icon(Icons.refresh, size: 20)),
        Consumer<EthWalletVM>(
            builder: (context, vm, _) => Text(
                '${getString(context)?.gas_estimate}: ${vm.gasEstimate ?? 0}',
                style: getStyle(context).bodySmall))
      ]),

      const SizedBox(height: 20),

      // send btn
      ButtonWidget(getString(context)?.send, () async {
        await vm.sendEth(context);
      })
    ]);
  }
}
