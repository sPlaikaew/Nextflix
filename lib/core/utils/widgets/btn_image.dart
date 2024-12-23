import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BtnImage extends StatelessWidget {
  final VoidCallback onPress;
  final String text;
  final String imagePath;
  final double fontSize;
  final Color textColor;
  final FontWeight fontWeight;

  const BtnImage({
    super.key,
    required this.onPress,
    required this.text,
    required this.imagePath,
    this.fontSize = 10,
    this.textColor = Colors.white,
    this.fontWeight = FontWeight.w400,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Column(
        children: [
          SvgPicture.asset(imagePath),
          const SizedBox(height: 3),
          Text(
            text,
            style: TextStyle(
              fontSize: fontSize,
              color: textColor,
              fontWeight: fontWeight,
            ),
          ),
        ],
      ),
    );
  }
}
