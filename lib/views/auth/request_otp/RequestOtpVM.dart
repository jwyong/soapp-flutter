import 'package:flutter/material.dart';
import 'package:soapp/views/BaseVM.dart';

class RequestOtpVM extends BaseVM with ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isBtnEnabled = false;

  // form field
  formFieldOnChanged(String value) {
    setFormData2(value);

    // update UI if btn enabled bool changed
    if (isBtnEnabled != value.isNotEmpty) {
      isBtnEnabled = value.isNotEmpty;
      notifyListeners();
      debugPrint("JAY_LOG: RequestOtpVM, formFieldOnChanged, isBtnEnabled = $isBtnEnabled");
    }
  }

  // submit btn
  submitBtnOnPressed() {
    debugPrint("JAY_LOG: RequestOtpVM, submitBtnOnPressed, ");
  }
}