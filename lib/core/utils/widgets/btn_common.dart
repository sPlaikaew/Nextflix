import 'package:flutter/material.dart';
import 'package:nextflix/core/utils/themes/color.dart';

class BtnCommon extends StatelessWidget {
  final VoidCallback onPress;
  final String text;
  final Color color;
  final double borderRadius;
  final double height;
  final double width;
  final double fontSize;
  final Color textColor;
  final FontWeight fontWeight;

  const BtnCommon({
    super.key,
    required this.onPress,
    required this.text,
    this.color = NextFlixColor.primary,
    this.borderRadius = 4,
    this.height = 35,
    this.width = 100,
    this.fontSize = 18,
    this.textColor = Colors.white,
    this.fontWeight = FontWeight.w700,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        backgroundColor: color, // background
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        elevation: 0,
      ),
      child: Container(
          height: height,
          width: width,
          alignment: Alignment.center,
          child: Text(text.length > 9 ? '${text.substring(0, 7)}...' : text,
              style: TextStyle(
                fontWeight: fontWeight,
                fontSize: fontSize,
                color: textColor,
              ))),
    );
  }
}
