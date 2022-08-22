import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:soapp/views/base_vm.dart';

class RequestOtpVM extends BaseVM with ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isTermsCheckboxChecked = false;
  bool isSubmitBtnEnabled = false;

  /// form field
  // country code picker onSelect - update to formData
  final ccpController = TextEditingController();

  void ccpOnSelect(Country country) {
    setFormData0(country.phoneCode);
    ccpController.text = '+${country.phoneCode}';
  }

  // phone number - formData1
  void phoneNumberFieldOnChange(String value) {
    setFormData1(value);

    // update submitBtn ui if needed
    if (isSubmitBtnEnabled != getSubmitBtnEnabled()) {
      isSubmitBtnEnabled = getSubmitBtnEnabled();
      notifyListeners();
    }
  }

  // terms checkbox
  void termsCheckboxOnTap() {
    isTermsCheckboxChecked = !isTermsCheckboxChecked;
    isSubmitBtnEnabled = getSubmitBtnEnabled();
    notifyListeners();
  }

  void termsCheckboxOnChange(bool? _) {
    termsCheckboxOnTap();
  }

  // submit btn
  bool getSubmitBtnEnabled() {
    if (formData[1] == null) return false;
    return formData[1]!.length > 8 && isTermsCheckboxChecked;
  }
  submitBtnOnPressed() {}
}
