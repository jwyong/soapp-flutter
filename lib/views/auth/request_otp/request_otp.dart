import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:soapp/utils/dimensions.dart';
import 'package:soapp/views/auth/request_otp/RequestOtpVM.dart';
import 'package:soapp/widgets/ClearableFieldWidget.dart';
import 'package:soapp/widgets/ExpandedWidget.dart';
import 'package:soapp/widgets/TextWidget.dart';

import '../../../widgets/BaseStatelessWidget.dart';
import '../../../widgets/ButtonWidget.dart';
import '../../../widgets/ScrollableSingleWidget.dart';

class RequestOtpScreen extends BaseStatelessWidget {
  const RequestOtpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint("JAY_LOG: RequestOtpScreen, build, ");
    final RequestOtpVM vm = Provider.of(context, listen: false);

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
              padding:
                  EdgeInsets.symmetric(horizontal: respWidth(mainPaddingHori)),
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
                    key: vm.formKey,
                    child: Row(
                      children: <Widget>[
                        // 1 - country code
                        // countryCode(),
                        // SizedBox(width: respWidth(10)),

                        // 2 - phone
                        ClearableFieldWidget(
                          hintText: getString(context)?.phone_number ?? "",
                          initialText: vm.formData[2],
                          onChanged: vm.formFieldOnChanged,
                          maxLength: 12,
                          textInputAction: TextInputAction.done,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                      ],
                    ),
                  ),

                  const ExpandedWidget(12, 10),

                  // checkbox
                  // termsCheckbox(),

                  // submit btn
                  Consumer<RequestOtpVM>(builder: (context, vm, _) {
                    debugPrint("JAY_LOG: RequestOtpScreen, build, onChange "
                        "isBtnEnabled = ${vm.isBtnEnabled}");

                    return ButtonWidget(
                      getString(context)?.send_otp,
                      vm.isBtnEnabled?
                      vm.submitBtnOnPressed : null,
                    );
                  }),

                  const ExpandedWidget(18, 10),
                ],
              ),
            )));
  }
}
