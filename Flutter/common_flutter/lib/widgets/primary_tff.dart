import 'package:common_flutter/commons/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PrimaryTFF extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final bool autofocus = false;
  final bool readOnly = false;
  final String obscuringCharacter = '•';
  final bool obscureText = false;
  final int? maxLines = 1;
  final int? minLines;
  final int? maxLength;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final void Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final bool? enabled;
  final String? hintText;
  final String? prefixText;
  final String? suffixText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  const PrimaryTFF({
    super.key,
    this.controller,
    this.focusNode,
    this.keyboardType,
    this.minLines,
    this.maxLength,
    this.onChanged,
    this.onTap,
    this.onFieldSubmitted,
    this.validator,
    this.inputFormatters,
    this.enabled,
    this.hintText,
    this.prefixText,
    this.suffixText,
    this.prefixIcon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      keyboardType: keyboardType,
      minLines: minLines,
      maxLength: maxLength,
      onChanged: onChanged,
      onTap: onTap,
      showCursor: false,
      onFieldSubmitted: onFieldSubmitted,
      validator: validator,
      inputFormatters: inputFormatters,
      enabled: enabled,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: primaryText),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        prefixText: prefixText,
        suffixText: suffixText,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
