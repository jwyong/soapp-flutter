import 'package:bip32/bip32.dart';
import 'package:bip39/bip39.dart';
import 'package:flutter/services.dart';
import 'package:hex/hex.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';

import '../models/crypto/crypto_key_pair.dart';

class CryptoClientService {
  // TODO: make singleton service
  // String devUrl = 'http://192.168.1.30:7545';
  // String ethUrl = 'https://main-rpc.linkpool.io';
  final Web3Client ethClient = Web3Client('https://main-rpc.linkpool.io', Client());
}





/// for custom smart contracts
// DeployedContract? _deployedContract;
// Future<void> loadContract() async {
//   if (_deployedContract != null) return;
//
//   // get abi from json file
//   String abiStr = await rootBundle.loadString("src/abis/Xcoin.json");
//   var abiJson = jsonDecode(abiStr);
//   String abi = jsonEncode(abiJson['abi']);
//
//
//   // deployed contract address from ganache
//   EthereumAddress contractAddress =
//       EthereumAddress.fromHex('0x55b060da85815fb7f774391d310A8e8545681cF9');
//   _deployedContract =
//       DeployedContract(ContractAbi.fromJson(abi, "Xcoin"), contractAddress);
// }

// basic query function
// Future<List<dynamic>> query(String functionName, List<dynamic> args) async {
//   final ethFunction = _deployedContract!.function(functionName);
//
//
//   final result = await ethClient.call(
//       contract: _deployedContract!, function: ethFunction, params: args);
//
//   return result;
// }

// basic submit function
// Future<String> submit(
//     String functionName, List<dynamic> args, String privateKey) async {
//   if (_deployedContract == null) return "";
//
//   final ethFunction = _deployedContract!.function(functionName);
//   EthPrivateKey key = EthPrivateKey.fromHex(privateKey);
//   Transaction transaction = Transaction.callContract(
//       contract: _deployedContract!,
//       function: ethFunction,
//       parameters: args,
//       maxGas: 100000);
//
//   final result =
//       await ethClient.sendTransaction(key, transaction, chainId: 4);
//   return result;
// }