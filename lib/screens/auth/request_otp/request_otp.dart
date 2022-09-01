import 'package:country_picker/country_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:move_to_background/move_to_background.dart';
import 'package:provider/provider.dart';
import 'package:soapp/widgets/asset_img_png.dart';

import '../../../utils/colors.dart';
import '../../../utils/constants.dart';
import '../../../utils/dimensions.dart';
import '../../../widgets/base_stateless_widget.dart';
import '../../../widgets/button_widget.dart';
import '../../../widgets/clearable_field_widget.dart';
import '../../../widgets/expanded_widget.dart';
import '../../../widgets/scrollable_single_widget.dart';
import 'request_otp_vm.dart';

class RequestOtpScreen extends BaseStatelessWidget {
  const RequestOtpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RequestOtpVM vm = Provider.of(context, listen: false);
    vm.initFormData();

    return WillPopScope(
        child: Scaffold(
            body: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("$assetsImg/bg_request_otp.png"),
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter)),
                child: ScrollableSingleWidget(
                  padding:
                      const EdgeInsets.symmetric(horizontal: mainPaddingHori),
                  child: Column(
                    children: <Widget>[
                      // space
                      // const Spacer(20),
                      const ExpandedWidget(25, 20),

                      // soapp word logo
                      const FractionallySizedBox(
                          widthFactor: 0.35,
                          child: AssetLogoPngWidget('words_white')),

                      const ExpandedWidget(55, 20),

                      // what's your phone number?
                      Text(getString(context)?.input_phone_number ?? "",
                          style: getStyle(context).headline6),
                      const SizedBox(height: 10),

                      // phone number form
                      _PhoneNumberFormWidget(vm),

                      const ExpandedWidget(12, 10),

                      // terms and conditions checkbox
                      _TermsCheckboxWidget(vm),

                      // submit btn
                      Consumer<RequestOtpVM>(builder: (context, vm, _) {
                        return ButtonWidget(
                          getString(context)?.send_otp,
                          vm.isSubmitBtnEnabled
                              ? () {
                                  vm.submitBtnOnPressed(context);
                                }
                              : null,
                        );
                      }),

                      const ExpandedWidget(18, 10),
                    ],
                  ),
                ))),
        onWillPop: () async {
          MoveToBackground.moveTaskToBack();
          return false;
        });
  }
}

/// ccp + phone number form
class _PhoneNumberFormWidget extends BaseStatelessWidget {
  const _PhoneNumberFormWidget(this.vm);

  final RequestOtpVM vm;

  @override
  Widget build(BuildContext context) {
    final OutlineInputBorder border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(formRadius),
        borderSide: const BorderSide(color: Colors.transparent));

    return Form(
        key: vm.formKey,
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // 1 - country code
              Flexible(
                  flex: 4,
                  child: TextFormField(
                      readOnly: true,
                      controller: vm.ccpController,
                      onTap: () {
                        showCountryPicker(
                            context: context,
                            showPhoneCode: true,
                            favorite: favoritesCCP,
                            onSelect: vm.ccpOnSelect);
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: grey1,
                        enabledBorder: border,
                        focusedBorder: border,
                      ))),

              const SizedBox(width: 10),

              // 2 - phone
              Flexible(
                  flex: 8,
                  child: ClearableFieldWidget(
                      hintText: getString(context)?.phone_number ?? "",
                      controller: vm.phoneNumberController,
                      onChanged: vm.phoneNumberFieldOnChange,
                      maxLength: 12,
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ]))
            ]));
  }
}

/// terms and conditions checkbox
class _TermsCheckboxWidget extends BaseStatelessWidget {
  const _TermsCheckboxWidget(this.vm);

  final RequestOtpVM vm;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Consumer<RequestOtpVM>(builder: (context, vm, _) {
          return Checkbox(
              activeColor: primaryLight3,
              value: vm.isTermsCheckboxChecked,
              onChanged: vm.termsCheckboxOnChange);
        }),
        RichText(
          text: TextSpan(children: [
            TextSpan(
                recognizer: TapGestureRecognizer()
                  ..onTap = vm.termsCheckboxOnChange(null),
                text: getString(context)?.agree_terms_1 ?? "",
                style: getStyle(context).bodyMedium),
            TextSpan(
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    // launch(GlobalVars.terms);
                  },
                text: getString(context)?.agree_terms_2 ?? "",
                style: getStyle(context).bodyMedium?.apply(color: primaryDark4))
          ]),
        ),
      ],
    );
  }
}
