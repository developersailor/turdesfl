import 'package:flutter/material.dart';

enum ButtonType { elevated, text, outlined }

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.text,
    required this.onPressed,
    super.key,
    this.buttonType = ButtonType.elevated,
    this.color,
    this.textColor,
    this.borderColor,
    this.borderRadius,
    this.elevation,
    this.padding,
  });
  final String text;
  final VoidCallback onPressed;
  final ButtonType buttonType;
  final Color? color;
  final Color? textColor;
  final Color? borderColor;
  final double? borderRadius;
  final double? elevation;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    final buttonStyle = ButtonStyle(
      backgroundColor: WidgetStateProperty.all(color),
      foregroundColor: WidgetStateProperty.all(textColor),
      padding: WidgetStateProperty.all(padding ?? const EdgeInsets.all(16)),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 8.0),
          side: borderColor != null
              ? BorderSide(color: borderColor!)
              : BorderSide.none,
        ),
      ),
      elevation: WidgetStateProperty.all(elevation ?? 2.0),
    );

    switch (buttonType) {
      case ButtonType.elevated:
        return ElevatedButton(
          onPressed: onPressed,
          style: buttonStyle,
          child: Text(text),
        );
      case ButtonType.text:
        return TextButton(
          onPressed: onPressed,
          style: buttonStyle,
          child: Text(text),
        );
      case ButtonType.outlined:
        return OutlinedButton(
          onPressed: onPressed,
          style: buttonStyle,
          child: Text(text),
        );
    }
  }
}
