import 'package:flutter/material.dart';

class InputTextCommon extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  final String hint;
  final TextStyle hintStyle;
  final TextStyle textStyle;
  final Color fillColor;

  const InputTextCommon({
    super.key,
    required this.onChanged,
    required this.hint,
    required this.hintStyle,
    this.textStyle = const TextStyle(color: Colors.black),
    this.fillColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: textStyle,
      decoration: InputDecoration(
        border: InputBorder.none,
        labelText: hint,
        labelStyle: hintStyle,
        filled: true,
        fillColor: fillColor,
      ),
      onChanged: onChanged,
    );
  }
}
