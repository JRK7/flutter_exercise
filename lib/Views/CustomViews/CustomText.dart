import 'package:flutter/cupertino.dart';

class CustomText extends StatelessWidget {
  final String? title;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextOverflow? overflow;

  const CustomText(
      {super.key,
      this.title,
      this.textColor,
      this.fontSize,
      this.fontWeight,
      this.overflow = TextOverflow.ellipsis});

  @override
  Widget build(BuildContext context) {
    return Text(
      title ?? "",
      style: TextStyle(
          overflow: overflow,
          color: textColor,
          fontSize: fontSize,
          fontWeight: fontWeight ?? FontWeight.w600),
    );
  }
}
