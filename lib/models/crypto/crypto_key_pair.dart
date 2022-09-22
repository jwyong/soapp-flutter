class CryptoKeyPair {
  final String privateKey;
  final String publicKey;

  CryptoKeyPair(this.privateKey, this.publicKey);

  Map<String, dynamic> toJson() =>
      {"privateKey": privateKey, "publicKey": publicKey};

  factory CryptoKeyPair.fromJson(Map<String, dynamic> json) {
    return CryptoKeyPair(json["privateKey"], json["publicKey"]);
  }
}