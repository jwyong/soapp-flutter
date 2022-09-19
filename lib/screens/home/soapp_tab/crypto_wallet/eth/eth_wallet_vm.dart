import 'package:flutter/cupertino.dart';
import 'package:soapp/screens/base_vm.dart';
import 'package:soapp/utils/ui_functions.dart';
import 'package:web3dart/web3dart.dart';

import '../../../../../repos/eth_repo.dart';
import '../../../../../utils/constants.dart';

class EthWalletVM extends BaseVM with ChangeNotifier {
  // TODO: singleton?
  final EthRepo cryptoRepo = EthRepo();

  // keys
  String privateKey = '';
  String publicAddress = '';

  // balance
  double ethBalance = 0;

  // init - getAddress then balance
  void init() async {
    await _getKeys();
    getBalance();
  }

  // get keys from sp
  Future<void> _getKeys() async {
    privateKey = await getSpStringFuture(spKeyCryptoPrivKey);
    publicAddress = await getSpStringFuture(spKeyCryptoPubKey);
  }

  // get balance
  void getBalance() async {
    ethBalance =
        await cryptoRepo.getEthBalance(EthereumAddress.fromHex(publicAddress));

    notifyListeners();
  }

  // send crypto
  final TextEditingController sendAddressController = TextEditingController();

  double? gasEstimate;

  void amountInputOnChange(String val) {
    setFormData1(val);
  }

  void sendEthInputOnChange(String value) {
    setFormData0(value);
  }

  void pasteBtnOnClick() {
    pasteFromClipboard().then((String value) {
      sendAddressController.text = value;
      sendEthInputOnChange(value);
    });
  }

  void estimateGas() async {
    gasEstimate = await cryptoRepo.getGasPriceInGwei();

    notifyListeners();
  }

  Future<void> sendEth(BuildContext context) async {
    // get current gas estimate first
    double gasInGwei = await cryptoRepo.getGasPriceInGwei();

    try {
      final String toAddress = getFormData(0);
      final double ethAmount = double.parse(getFormData(1));
      cryptoRepo.sendEth(privateKey, toAddress, ethAmount, gasInGwei.ceil()).then((value) {
        getBalance();

        showSnackbar(context,
            '${getString(context)?.send_eth_success(ethAmount.toString(), toAddress)}, hash = $value');
      });
    } catch (error) {
      debugPrint("JAY_LOG: CryptoWalletVM, sendEth, error = $error");
    }
  }
}
