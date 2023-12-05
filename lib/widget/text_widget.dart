
import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String titleText;
  final double fontSize;
  final Color textColor;

  TextWidget({Key? key,
    required this.titleText,
    required this.fontSize,
    required this.textColor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(titleText, style: TextStyle(color: textColor, fontSize: fontSize));
  }
}
