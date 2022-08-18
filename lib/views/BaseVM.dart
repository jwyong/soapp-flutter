class BaseVM {
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

//===== validation
//   String validateEmpty(String value) {
    // if (value.isEmpty) {
    //   return StringVals.getString(StringVals.PHONE_EMPTY);
    // } else {
    //   return null;
    // }
  // }
}
