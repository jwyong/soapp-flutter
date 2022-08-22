import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';

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

//===== formData (onSaved)
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

//===== validation
//   String validateEmpty(String value) {
// if (value.isEmpty) {
//   return StringVals.getString(StringVals.PHONE_EMPTY);
// } else {
//   return null;
// }
// }
}
