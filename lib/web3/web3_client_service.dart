import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';

class CryptoClientService {
  // TODO: make singleton service
  // String devUrl = 'http://192.168.1.30:7545';
  // String ethUrl = 'https://main-rpc.linkpool.io';
  final Web3Client ethClient = Web3Client('https://eth-mainnet.public.blastapi.io', Client());
}