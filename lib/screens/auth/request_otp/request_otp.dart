import 'package:flutter/material.dart';
import 'package:soapp/widgets/ExpandedWidget.dart';
import 'package:soapp/widgets/FormFieldWidget.dart';
import 'package:soapp/widgets/TextWidget.dart';
import '../../../widgets/BaseStatelessWidget.dart';
import '../../../widgets/ScrollableSingleWidget.dart';

class RequestOtpScreen extends BaseStatelessWidget {
  const RequestOtpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/img/bg_request_otp.png"),
                fit: BoxFit.cover,
                alignment: Alignment.topCenter)),

        child: ScrollableSingleWidget(
            child: Column(
                children: <Widget>[
                // space
                const ExpandedWidget(25, 20),

            // soapp word logo
            Image(
              image: const AssetImage("assets/logo/words_white.png"),
              width: respWidthPercent(35),
            ),

            const ExpandedWidget(55, 20),

            // what's your phone number?
            TextWidget(getString(context)?.input_phone_number, 20),
            SizedBox(height: respHeight(10)),

            // form
            Form(
              key: formKey,
              child: Row(
                children: <Widget>[
                  // 1 - country code
                  // countryCode(),

                  SizedBox(width: respWidth(10)),

                  // 2 - phone
                  Expanded(
                    child: FormFieldWidget(
                      hintText: getString(context)?.phone_number ?? "",
                      initialText: "initial", //formData[2]
                      // onSaved: setFormData2,
                      // onChanged: phoneNumberOnChanged,
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.phone,
                    ),
                  ),
                ],
              ),
            ),

            const ExpandedWidget(12, 10),

        // checkbox
        // termsCheckbox(),
        // submit btn
        // MyRaisedBtn(
        //     StringVals.getString(StringVals.SEND_OTP),
        //     isBtnEnabled
        //         ? () {
        //             submitBtnOnClick(null);
        //           }
        //         : null),

        const ExpandedWidget(18, 10),
        ],
      ),
    )));
  }
}
