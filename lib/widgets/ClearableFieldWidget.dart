import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/colors.dart';
import '../utils/dimensions.dart';
import 'BaseStatelessWidget.dart';

class ClearableFieldWidget extends BaseStatefulWidget {
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
  final List<TextInputFormatter>? inputFormatters;
  final bool? obscureText;
  final IconButton? prefixIcon;
  final TextCapitalization? textCapitalization;

  const ClearableFieldWidget(
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
      this.inputFormatters,
      this.obscureText,
      this.prefixIcon,
      this.textCapitalization})
      : super(key: key);

  @override
  State createState() => _State();
}

class _State extends State<ClearableFieldWidget> {
  final TextEditingController controller = TextEditingController();
  var shouldShowClearBtn = false;

  @override
  Widget build(BuildContext context) {
    controller.addListener(() {
      if (controller.text.isNotEmpty != shouldShowClearBtn) {
        shouldShowClearBtn = controller.text.isNotEmpty;
        setState(() {});
      }
    });

    return Expanded(
        child: TextFormField(
      controller: controller,
      onChanged: widget.onChanged,
      onSaved: widget.onSaved,
      maxLength: widget.maxLength,
      maxLines: widget.maxLines,
      autofocus: widget.autoFocus ?? true,
      obscureText: widget.obscureText ?? false,
      focusNode: widget.focusNode,
      textCapitalization: widget.textCapitalization ?? TextCapitalization.words,
      textAlign: TextAlign.start,
      inputFormatters: widget.inputFormatters,
      validator: widget.validator,
      onFieldSubmitted: widget.onFieldSubmitted,
      textInputAction: widget.textInputAction,
      style: TextStyle(fontSize: widget.respSP(16)),
      initialValue: widget.initialText,
      decoration: formFieldInputDeco(
          suffixIcon: controller.text.isNotEmpty
              ? IconButton(
                  color: grey9,
                  icon: const Icon(Icons.clear_rounded),
                  onPressed: () {
                    controller.clear();
                    widget.onChanged?.call(controller.text);
                  })
              : null,
          prefixIcon: widget.prefixIcon,
          hintText: widget.hintText,
          fillColour: widget.fillColour),
    ));
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
      hintStyle: TextStyle(color: grey8, fontSize: widget.respSP(formFontSize)),
      filled: true,
      contentPadding: EdgeInsets.symmetric(
          horizontal: widget.respWidth(formPaddingHori),
          vertical: widget.respHeight(formPaddingVerti)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.respWidth(formRadius)),
          borderSide: const BorderSide(color: Colors.transparent)),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.respWidth(formRadius)),
          borderSide: const BorderSide(color: Colors.transparent)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.respWidth(formRadius)),
          borderSide: const BorderSide(color: Colors.transparent)),
    );
  }
}
