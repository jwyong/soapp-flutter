import 'dart:async';

import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';
import 'package:flutter/material.dart';

class BaseVM {
  /// sharedPrefs
  EncryptedSharedPreferences encSP = EncryptedSharedPreferences();

  getSpStringFuture(String key) => encSP.getString(key);

  setSpString(String key, value) {
    encSP.setString(key, value.toString());
  }

  // get sp bool from str
  getSpBool(String boolStr) => boolStr == "true";

  Map<int, String> formData = {};

  /// formData
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
  navigateTo(BuildContext context, String routeName,
      {bool shouldClosePrevious = false}) {
    if (shouldClosePrevious) {
      Navigator.pushReplacementNamed(context, routeName);
    } else {
      Navigator.pushNamed(context, routeName);
    }
  }

  /// snackbar
  showSnackbar(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  delayMs(int milliSeconds, void Function() function) {
    Timer(Duration(milliseconds: milliSeconds), function);
  }
}
