import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextField extends StatelessWidget {
  const AppTextField(
      {required this.hintText,
      this.suffix,
      this.key,
      required this.controller,
      required this.textInputType,
      this.textAlign = TextAlign.start,
      this.focusNode,
      this.onChanged,
      this.inputFormatter = const [],
      this.textCapitalization = TextCapitalization.none,
      this.errorText,
      this.enable = true,
      this.validator,
      this.disabledBorderSide,
      this.prefix});
  final Widget? suffix;
  final String hintText;
  final TextEditingController controller;
  final TextInputType textInputType;
  final Function(String)? validator;
  final Key? key;
  final TextAlign textAlign;
  final Function(String)? onChanged;
  final FocusNode? focusNode;
  final String? errorText;
  final bool enable;
  final Widget? prefix;
  final List<TextInputFormatter> inputFormatter;
  final TextCapitalization textCapitalization;
  final BorderSide? disabledBorderSide;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: key,
      child: TextFormField(
        controller: controller,
        // validator: validator,
        keyboardType: textInputType,
        textAlign: textAlign,
        focusNode: focusNode,
        enabled: enable,
        textCapitalization: textCapitalization,
        cursorWidth: 1.40,
        cursorHeight: 20.0,
        onChanged: onChanged,
        inputFormatters: inputFormatter,
        decoration: InputDecoration(
            labelText: hintText,
            suffixIcon: suffix,
            prefix: prefix,
            errorText: errorText,
            contentPadding: const EdgeInsets.only(left: 12.0, right: 10),
            disabledBorder: OutlineInputBorder(
              borderSide: disabledBorderSide??BorderSide(color:Colors.grey.shade400)
            ),
            border: OutlineInputBorder(
            )),
      ),
    );
  }
}
