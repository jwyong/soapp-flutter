import 'dart:async';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';
import 'package:flutter/material.dart';

class BaseVM {
  /// sharedPrefs
  EncryptedSharedPreferences encSP = EncryptedSharedPreferences();

  Future<String> getSpStringFuture(String key) => encSP.getString(key);

  Future<bool> setSpString(String key, value) =>
    encSP.setString(key, value.toString());

  // get sp bool from str
  bool getSpBool(String boolStr) => boolStr == "true";

  /// formData
  Map<int, String> formData = {};

  // save value to var for each form field
  void setFormData0(String? val) {
    if (val != null) formData[0] = val;
  }

  void setFormData1(String? val) {
    if (val != null) formData[1] = val;
  }

  void setFormData2(String? val) {
    if (val != null) formData[2] = val;
  }

  String getFormData(int index) => formData[index] ?? '';

  /// route navigation
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  // finish
  void finish(BuildContext context) {
    Navigator.pop(context);
  }

  // navigateTo
  void navigateTo(BuildContext context, String routeName,
      {bool shouldClosePrevious = false}) {
    final navigator = Navigator.of(context);

    if (shouldClosePrevious) {
      navigator.pushReplacementNamed(routeName);
    } else {
      navigator.pushNamed(routeName);
    }
  }

  /// snackbar
  showSnackbar(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  /// strings/styles
  AppLocalizations? getString(BuildContext context) =>
      AppLocalizations.of(context);
}
