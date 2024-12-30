import 'package:flutter/material.dart';

import 'CustomText.dart';

class CustomBubbleWidget extends StatelessWidget {
  const CustomBubbleWidget(
      {super.key,
      this.textColor,
      this.title,
      this.iconData,
      this.circleBorderColor,
      this.imageColor,
      this.circleBackgroundColor,
      this.size = const Size(20, 20),
      this.bubbleBackgroundColor = const Color(0xFFFFD700),
      this.maxWidth = 200});

  final Size size;
  final Color? textColor;
  final String? title;
  final IconData? iconData;
  final Color? circleBorderColor;
  final Color? imageColor;
  final Color? circleBackgroundColor;
  final Color? bubbleBackgroundColor;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    double circleSize = size.width;
    double textWidth = 0;
    if (title != null) {
      textWidth = _calculateTextWidth(text: title ?? "");
    }
    double totalWidth = circleSize + 20 + textWidth;
    totalWidth = totalWidth;
    return Container(
      width: totalWidth,
      height: size.height,
      decoration: BoxDecoration(
          color: bubbleBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(circleSize / 2),
            topRight: Radius.circular(circleSize / 2),
            bottomLeft: Radius.circular(circleSize / 2),
          )),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _customHighlightWidget(
              circleBorderColor: circleBorderColor,
              icon: iconData,
              imageColor: imageColor,
              circleBackgroundColor: circleBackgroundColor),
          const SizedBox(
            width: 5,
          ),
          Expanded(child: CustomText(title: title, textColor: textColor)),
        ],
      ),
    );
  }

  Widget _customHighlightWidget(
      {Color? circleBorderColor,
      Color? circleBackgroundColor,
      Color? imageColor,
      IconData? icon}) {
    return Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
            // Background color of the circle (optional, helps with visibility of the border)
            shape: BoxShape.circle,
            border: Border.all(
              color: circleBorderColor ?? Colors.transparent, // Border color
              width: 2.0, // Border width
            ),
            color: circleBackgroundColor),
        child: Icon(
          size: size.width / 2,
          icon,
          color: imageColor,
        ));
  }

  double _calculateTextWidth(
      {required String text,
      double? fontSize,
      FontWeight? fontWeight,
      Color? textColor}) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(
          fontSize: fontSize ?? 14, // Default font size if none is passed
          fontWeight: fontWeight ??
              FontWeight.w600, // Default font weight if none is passed
          color:
              textColor ?? Colors.black, // Default text color if none is passed
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: double.infinity);

    return textPainter.size.width;
  }
}
