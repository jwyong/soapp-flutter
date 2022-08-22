/// country code obj for sharedPrefs (with flagEmoji and phoneCode only)
class CountryCode {
  final String flagEmoji;
  final String phoneCode;

  CountryCode(this.flagEmoji, this.phoneCode);

  Map<String, dynamic> toJson() =>
      {"flagEmoji": flagEmoji, "phoneCode": phoneCode};

  factory CountryCode.fromJson(Map<String, dynamic> json) {
    return CountryCode(json["flagEmoji"], json["phoneCode"]);
  }
}
