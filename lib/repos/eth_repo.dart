import 'package:bip32/bip32.dart';
import 'package:bip39/bip39.dart';
import 'package:flutter/foundation.dart';
import 'package:hex/hex.dart';
import 'package:web3dart/web3dart.dart';

import '../models/crypto/crypto_key_pair.dart';
import '../web3/web3_client_service.dart';

class EthRepo {
  // TODO: make singleton
  final CryptoClientService web3clientService = CryptoClientService();
  final EtherAmount gasPrice = EtherAmount.fromUnitAndValue(EtherUnit.gwei, 5);
  final int maxGas = 21000;

  // get credentials from privateKey
  Credentials getCredentials(String privateKey) =>
      EthPrivateKey.fromHex(privateKey);

  // get private and public key from mnemonic (recovery phrase) inputted by user
  Future<CryptoKeyPair> getKeysFromMnemonic(
    String mnemonic, {
    String derivePath = "m/44'/60'/0'/0/",
    int childIndex = 0,
  }) async {
    // get seed from mnemonic
    final String seed = await compute(mnemonicToSeedHex, mnemonic);

    // get private key based on derivePath
    final BIP32 root = BIP32.fromSeed(HEX.decode(seed) as Uint8List);
    final BIP32 child = root.derivePath("$derivePath$childIndex");
    final String privateKey = HEX.encode(child.privateKey!);

    // get public key from private key
    final EthPrivateKey ethPrivateKey = EthPrivateKey.fromHex(privateKey);
    final EthereumAddress ethereumAddress = ethPrivateKey.address;

    return CryptoKeyPair(privateKey, ethereumAddress.toString());
  }

  // get eth wallet balance
  Future<double> getEthBalance(EthereumAddress publicKey) async {
    final ethAmount = await web3clientService.ethClient.getBalance(publicKey);
    return ethAmount.getValueInUnit(EtherUnit.ether);
  }

  Future<double> getGasPriceInGwei() async {
    final EtherAmount gasPrice =
        await web3clientService.ethClient.getGasPrice();

    return gasPrice.getValueInUnit(EtherUnit.gwei);
  }

  // estimateGas(
  //   sender: EthereumAddress.fromHex(fromAddress),
  //   to: EthereumAddress.fromHex(toAddress),
  //   value: getWeiFromEtherDouble(etherToSend),
  //   gasPrice: EtherAmount.inWei(gp),
  //   amountOfGas: gp,

  // data: contractFunction.encodeCall([
  //   EthereumAddress.fromHex(from),
  //   EthereumAddress.fromHex(to),
  //   tokenId,
  //   Uint8List.fromList([])
  // ]),
  // );

  // send eth to other address
  Future<String> sendEth(
          String privateKey, String toAddress, double etherToSend) async =>
      await web3clientService.ethClient.sendTransaction(
          getCredentials(privateKey),
          Transaction(
            to: EthereumAddress.fromHex(toAddress),
            gasPrice: gasPrice,
            maxGas: maxGas,
            value: getWeiFromEtherDouble(etherToSend),
          ));

  /// unit conversion
  final ethInWei = 1000000000000000000;

  // convert user inputted ether in double to wei
  EtherAmount getWeiFromEtherDouble(double ethDouble) =>
      EtherAmount.fromUnitAndValue(
          EtherUnit.wei, BigInt.from(ethDouble * ethInWei));
}
