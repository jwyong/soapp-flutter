import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soapp/utils/routes.dart';

import '../../../../../utils/constants.dart';
import '../../../../../widgets/base_stateless_widget.dart';
import '../../../../../widgets/button_widget.dart';
import '../../../../../widgets/clearable_field_widget.dart';
import '../crypto_wallet_vm.dart';
import 'recovery_vm.dart';

class RecoveryScreen extends BaseStatelessWidget {
  const RecoveryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CryptoWalletVM sharedVM = Provider.of(context, listen: false);
    final RecoveryVM vm = Provider.of(context, listen: false);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // title
        Text(getString(context)?.recover_wallet_title ?? '',
            style: getStyle(context)
                .titleMedium
                ?.apply(fontFamily: fontQuicksandBold)),
        const SizedBox(height: 10),

        // desc
        Text(
          getString(context)?.recover_wallet_desc ?? '',
          style: getStyle(context).labelLarge,
        ),
        const SizedBox(height: 15),

        // recovery phrase input + paste icon
        ClearableFieldWidget(
          controller: vm.rpController,
          maxLines: 3,
          hintText: getString(context)?.mnemonic_sample,
          onChanged: vm.recoveryPhraseFieldOnChange,
          suffixIcon: IconButton(
              tooltip: getString(context)?.paste_copied_text,
              onPressed: vm.pasteBtnOnClick,
              icon: const Icon(Icons.paste)),
        ),
        const SizedBox(height: 20),

        // submit btn
        Consumer<RecoveryVM>(builder: (context, vm, _) {
          return ButtonWidget(
              getString(context)?.submit,
              vm.isSubmitBtnEnabled
                  ? () {
                      vm.submitBtnOnClick(context);
                    }
                  : null);
        }),
      ],
    );
  }
}
