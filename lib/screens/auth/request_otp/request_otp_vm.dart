import 'dart:async';
import 'dart:convert';
import 'dart:io' show Platform;

import 'package:country_picker/country_picker.dart';
import 'package:country_picker/src/utils.dart';

import 'package:flutter/material.dart';
import '../../../models/auth/CountryCode.dart';
import '../../../utils/constants.dart';
import '../../../utils/routes.dart';
import '../../../screens/base_vm.dart';

class RequestOtpVM extends BaseVM with ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isTermsCheckboxChecked = false;
  bool isSubmitBtnEnabled = false;

  // init formData based on sp
  void initFormData() {
    // ccp
    if (formData[0] == null) {
      getSpStringFuture(spKeyCountryObj).then((String json) {
        if (json.isNotEmpty) {
          // update ccp with country flagEmoji + phoneCode
          CountryCode countryCode = CountryCode.fromJson(jsonDecode(json));
          updateCcpUI(countryCode.flagEmoji, countryCode.phoneCode);
        } else {
          // use MY by default
          String flagEmoji = Utils.countryCodeToEmoji("MY");
          updateCcpUI(flagEmoji, "60");
        }
      });
    }

    // phoneNumber
    if (formData[1] == null) {
      getSpStringFuture(spKeyPhoneNumber).then((String phoneNumber) {
        phoneNumberFieldOnChange(phoneNumber, shouldSetSp: false);
        phoneNumberController.text = phoneNumber;
      });
    }

    // terms checkbox
    getSpStringFuture(spKeyTermsCheckbox).then((String isCheckedStr) {
      bool isChecked = getSpBool(isCheckedStr)?? false;
      termsCheckboxOnChange(isChecked, shouldSetSp: false);
    });
  }

  /// form field
// country code picker onSelect - update to formData
  final ccpController = TextEditingController();

  void ccpOnSelect(Country country) {
    String flagEmoji = country.flagEmoji;
    String phoneCode = country.phoneCode;

    // create countryCode obj for sharedPrefs
    CountryCode countryCode = CountryCode(flagEmoji, phoneCode);
    setSpString(spKeyCountryObj, jsonEncode(countryCode.toJson()));

    updateCcpUI(flagEmoji, phoneCode);
  }

  void updateCcpUI(String flagEmoji, String phoneCode) {
    setFormData0(phoneCode);
    ccpController.text = '$flagEmoji +$phoneCode';
  }

// phone number - formData1
  final phoneNumberController = TextEditingController();

  void phoneNumberFieldOnChange(String value, {bool shouldSetSp = true}) {
    setFormData1(value);

    if (shouldSetSp) setSpString(spKeyPhoneNumber, value);

    // update submitBtn ui if needed
    if (isSubmitBtnEnabled != getSubmitBtnEnabled()) {
      isSubmitBtnEnabled = getSubmitBtnEnabled();
      notifyListeners();
    }
  }

// terms checkbox
  void termsCheckboxOnChange(bool? isChecked, {bool shouldSetSp = true}) {
    isTermsCheckboxChecked = isChecked ?? !isTermsCheckboxChecked;

    // update to sp
    if (shouldSetSp) setSpString(spKeyTermsCheckbox, isTermsCheckboxChecked);
    isSubmitBtnEnabled = getSubmitBtnEnabled();
    notifyListeners();
  }

// submit btn
  bool getSubmitBtnEnabled() =>
      getFormData(1).length > 8 && isTermsCheckboxChecked;

  // submitBtn - show toast and navigate to home
  // TODO: full auth flow soon
  submitBtnOnPressed(BuildContext context) {
    showSnackbar(context, 'formData: ${getFormData(0)}, ${getFormData(1)}');

    setSpString(spKeyInitialRoute, routeHome);
    navigateTo(context, routeHome, shouldClosePrevious: true);
  }

  @override
  void dispose() {
    phoneNumberController.dispose();
    ccpController.dispose();
    super.dispose();
  }
}
