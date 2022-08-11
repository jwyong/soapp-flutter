import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../utils/dimensions.dart';
import 'BaseStatelessWidget.dart';

class FormFieldWidget extends BaseStatelessWidget {
  final bool? autoFocus;
  final int? maxLines;
  final Color? fillColour;
  final int? maxLength;
  final String? hintText;
  final String? initialText;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldSetter<String>? onSaved;
  final TextInputType? textInputType;
  final bool? obscureText;
  final IconButton? prefixIcon;
  final TextCapitalization? textCapitalization;
  final IconButton? suffixIcon;

  const FormFieldWidget(
      {Key? key,
      this.hintText,
      this.maxLength,
      this.maxLines,
      this.autoFocus,
      this.onChanged,
      this.fillColour,
      this.initialText,
      this.focusNode,
      this.textInputAction,
      this.validator,
      this.onFieldSubmitted,
      this.onSaved,
      this.textInputType,
      this.obscureText,
      this.prefixIcon,
      this.suffixIcon,
      this.textCapitalization})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      onSaved: onSaved,
      maxLength: maxLength,
      maxLines: maxLines,
      autofocus: autoFocus ?? true,
      obscureText: obscureText ?? false,
      focusNode: focusNode,
      textCapitalization: textCapitalization ?? TextCapitalization.words,
      textAlign: TextAlign.start,
      keyboardType: textInputType,
      validator: validator,
      onFieldSubmitted: onFieldSubmitted,
      textInputAction: textInputAction,
      style: TextStyle(fontSize: respSP(16)),
      initialValue: initialText,
      decoration: formFieldInputDeco(
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          hintText: hintText,
          fillColour: fillColour),
    );
  }

  InputDecoration formFieldInputDeco(
      {IconButton? suffixIcon,
      IconButton? prefixIcon,
      Color? fillColour,
      String? hintText,
      String? errorTxt}) {
    return InputDecoration(
      alignLabelWithHint: true,
      errorStyle: const TextStyle(
        color: Colors.white,
        backgroundColor: red70a,
      ),
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      fillColor: fillColour,
      hintText: hintText,
      errorText: errorTxt,
      labelStyle: const TextStyle(backgroundColor: grey1, color: grey8),
      hintStyle: TextStyle(color: grey8, fontSize: respSP(formFontSize)),
      filled: true,
      contentPadding: EdgeInsets.symmetric(
          horizontal: respWidth(formPaddingHori),
          vertical: respHeight(formPaddingVerti)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(respWidth(formRadius)),
          borderSide: const BorderSide(color: Colors.transparent)),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(respWidth(formRadius)),
          borderSide: const BorderSide(color: Colors.transparent)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(respWidth(formRadius)),
          borderSide: const BorderSide(color: Colors.transparent)),
    );
  }

  Widget iconBtn(Icon icon, Function onPressed) {
    return IconButton(
      color: grey9,
      icon: icon,
      onPressed: onPressed.call(),
    );
  }
}
