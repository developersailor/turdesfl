import 'package:flutter/material.dart';

enum TextFieldType { textField, textFormField }

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.controller,
    super.key,
    this.textFieldType = TextFieldType.textField,
    this.labelText,
    this.hintText,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.maxLength,
    this.prefixIcon,
    this.suffixIcon,
    this.fillColor,
    this.isFilled = false,
    this.validator,
    this.readOnly = false,
  });
  final TextFieldType textFieldType;
  final TextEditingController controller;
  final String? labelText;
  final String? hintText;
  final TextInputType keyboardType;
  final bool obscureText;
  final int? maxLength;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? fillColor;
  final String? Function(String?)? validator;
  final bool isFilled;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    final inputDecoration = InputDecoration(
      labelText: labelText,
      hintText: hintText,
      filled: isFilled,
      fillColor: fillColor ?? Colors.grey[200],
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    );

    if (textFieldType == TextFieldType.textFormField) {
      return TextFormField(
        controller: controller,
        decoration: inputDecoration,
        keyboardType: keyboardType,
        obscureText: obscureText,
        maxLength: maxLength,
        validator: validator,
        readOnly: readOnly,
      );
    } else {
      return TextField(
        controller: controller,
        decoration: inputDecoration,
        keyboardType: keyboardType,
        obscureText: obscureText,
        maxLength: maxLength,
        readOnly: readOnly,
      );
    }
  }
}
