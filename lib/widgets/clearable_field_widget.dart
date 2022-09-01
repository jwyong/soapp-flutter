import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/colors.dart';
import '../utils/dimensions.dart';
import 'base_stateless_widget.dart';

class ClearableFieldWidget extends BaseStatefulWidget {
  final String? label;
  final bool? autoFocus;
  final int? maxLines;
  final Color? fillColour;
  final int? maxLength;
  final String? hintText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldSetter<String>? onSaved;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final bool? obscureText;
  final IconButton? prefixIcon;
  final TextCapitalization? textCapitalization;
  final IconButton? suffixIcon;

  const ClearableFieldWidget(
      {Key? key,
      this.label,
      this.hintText,
      this.maxLength,
      this.maxLines,
      this.autoFocus,
      this.onChanged,
      this.fillColour,
      this.controller,
      this.focusNode,
      this.textInputAction,
      this.validator,
      this.onFieldSubmitted,
      this.onSaved,
      this.keyboardType,
      this.inputFormatters,
      this.obscureText,
      this.prefixIcon,
      this.suffixIcon,
      this.textCapitalization})
      : super(key: key);

  @override
  State createState() => _State();
}

class _State extends State<ClearableFieldWidget> {
  bool shouldShowClearBtn = false;
  late TextEditingController controller;

  @override
  void initState() {
    controller = widget.controller ?? TextEditingController();
    controller.addListener(() {
      if (controller.text.isNotEmpty != shouldShowClearBtn) {
        shouldShowClearBtn = controller.text.isNotEmpty;
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: widget.onChanged,
      onSaved: widget.onSaved,
      maxLength: widget.maxLength,
      maxLines: widget.maxLines,
      autofocus: widget.autoFocus ?? false,
      obscureText: widget.obscureText ?? false,
      focusNode: widget.focusNode,
      textCapitalization: widget.textCapitalization ?? TextCapitalization.words,
      textAlign: TextAlign.start,
      inputFormatters: widget.inputFormatters,
      validator: widget.validator,
      onFieldSubmitted: widget.onFieldSubmitted,
      textInputAction: widget.textInputAction?? TextInputAction.done,
      style: widget.getStyle(context).subtitle1,
      keyboardType: widget.keyboardType,
      decoration: getInputDecoration(widget.label,
          suffixIcon: controller.text.isNotEmpty
              ? IconButton(
                  tooltip: widget.getString(context)?.clear,
                  color: grey9,
                  icon: const Icon(Icons.clear_rounded),
                  onPressed: () {
                    controller.clear();
                    widget.onChanged?.call(controller.text);
                  })
              : widget.suffixIcon,
          prefixIcon: widget.prefixIcon,
          hintText: widget.hintText,
          fillColour: widget.fillColour ?? grey1),
    );
  }

  InputDecoration getInputDecoration(String? label,
      {IconButton? suffixIcon,
      IconButton? prefixIcon,
      Color? fillColour,
      String? hintText,
      String? errorTxt}) {
    OutlineInputBorder border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(formRadius),
        borderSide: const BorderSide(color: Colors.transparent));

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
      label: label != null? Text(label): null,
      labelStyle: const TextStyle(backgroundColor: grey1, color: grey8),
      hintStyle: widget.getStyle(context).subtitle1?.apply(color: grey8),
      filled: true,
      contentPadding: const EdgeInsets.symmetric(
          horizontal: formPaddingHori, vertical: formPaddingVerti),
      focusedBorder: border,
      border: border,
      enabledBorder: border,
    );
  }
}
