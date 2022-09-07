import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/utils.dart';

class KingsbetTextFormField extends StatelessWidget {
  final String label;
  final TextStyle? style;
  final TextAlign textAlign;
  final TextInputType keyboardType;
  final ValueChanged<String>? onChange;
  // final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final String? errorText;
  final Widget? prefix;
  final Widget? suffix;
  final bool obscureText;
  final String? initialValue;
  final bool enabled;

  const KingsbetTextFormField({
    super.key,
    required this.label,
    this.style,
    required this.textAlign,
    required this.keyboardType,
    this.onChange,
    this.inputFormatters,
    this.controller,
    this.errorText,
    this.prefix,
    this.suffix,
    required this.obscureText,
    this.initialValue,
    required this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      obscureText: obscureText,
      textAlign: textAlign,
      style: style,
      autocorrect: false,
      textInputAction: TextInputAction.done,
      inputFormatters: inputFormatters,
      controller: controller,
      enabled: enabled,
      initialValue: initialValue,
      onChanged: onChange,
      cursorColor: context.theme.primaryColor,
      decoration: InputDecoration(
        labelText: label,
        errorText: errorText,
        prefix: prefix,
        suffix: suffix,
        isDense: true,
        labelStyle: const TextStyle(
          color: Colors.black,
        ),
        errorStyle: const TextStyle(color: Colors.redAccent),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(23),
          borderSide: BorderSide(color: Colors.grey[400]!),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(23),
          borderSide: BorderSide(color: Colors.grey[400]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(23),
          borderSide: BorderSide(color: Colors.grey[400]!),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
