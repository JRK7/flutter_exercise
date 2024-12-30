import 'package:flutter/material.dart';

extension PaddingExtension on Widget {
  Padding paddingOnly(
      {double top = 0, double left = 0, double right = 0, double bottom = 0}) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
          start: left, top: top, bottom: right, end: right),
      child: this,
    );
  }
}

extension BoxDecorationCustom on BoxDecoration {
  static BoxDecoration boxDecoration(
      {BoxShape shape = BoxShape.rectangle,
      Color color = Colors.black,
      double opacity = 0.2,
      double blurRadius = 8.0,
      double spreadRadius = 0.0,
      Offset offset = const Offset(0, 2),
      double borderRadius = 2,
      Color decorationColor = Colors.grey,
      double decorationColorOpacity = 0.0}) {
    return BoxDecoration(
        shape: shape,
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.2), // Shadow color with opacity
            blurRadius: blurRadius, // Blur the shadow to make it softer
            spreadRadius: spreadRadius, // Do not spread the shadow
            offset:
                offset, // Position the shadow below the container (bottom shadow)
          ),
        ],
        borderRadius: BorderRadius.circular(borderRadius),
        color: decorationColor.withOpacity(decorationColorOpacity));
  }
}

extension AddShadow on Widget {
  Container addShadow() {
    return Container(
      width: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.red,
            blurRadius: 1,
            spreadRadius: 1,
          )
        ],
      ),
      child: this,
    );
  }
}

extension StackExtension on List<Widget> {
  Stack stackWidgets({Alignment alignment = Alignment.centerRight}) {
    return Stack(
      alignment: alignment,
      children: this,
    );
  }
}
