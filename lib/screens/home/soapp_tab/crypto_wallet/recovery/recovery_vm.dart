import 'package:flutter/material.dart';
import 'package:soapp/models/crypto/crypto_key_pair.dart';
import 'package:soapp/repos/eth_repo.dart';
import 'package:soapp/utils/constants.dart';
import 'package:soapp/utils/routes.dart';
import 'package:soapp/utils/ui_functions.dart';

import '../../../../base_vm.dart';

class RecoveryVM extends BaseVM with ChangeNotifier {
  // TODO: singleton?
  final EthRepo cryptoRepo = EthRepo();

  /// recovery input
  final TextEditingController rpController = TextEditingController();
  bool isSubmitBtnEnabled = false;

  // pasteBtn - paste text to input
  void pasteBtnOnClick() {
    pasteFromClipboard().then((String value) {
      rpController.text = value;
      recoveryPhraseFieldOnChange(value);
    });
  }

  // update formData + ui on change
  void recoveryPhraseFieldOnChange(String value) {
    setFormData0(value);

    // update submit btn ui only if needed
    if (isSubmitBtnEnabled != value.isNotEmpty) {
      isSubmitBtnEnabled = value.isNotEmpty;
      notifyListeners();
    }
  }

  /// submit btn
  void submitBtnOnClick(BuildContext context) {
    cryptoRepo.getKeysFromMnemonic(getFormData(0)).then((CryptoKeyPair pair) {
      // store keys to sp for future use
      setSpString(spKeyCryptoPrivKey, pair.privateKey);
      setSpString(spKeyCryptoPubKey, pair.publicKey);

      // navigate to cryptoWallet screen
      finish(context);
      navigateTo(context, routeCryptoWallet);
    });
  }

  @override
  void dispose() {
    rpController.dispose();
    super.dispose();
  }
}
