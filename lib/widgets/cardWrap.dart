import 'package:flutter/material.dart';

class CardWrap extends StatelessWidget {
  const CardWrap(
      {super.key,
      required this.child,
      this.bgColor = Colors.white,
      this.isBorderOn = false,
      this.borderColor = Colors.black,
      this.padding = const EdgeInsets.all(0),
      this.borderRadius = 10,
      this.borderWidth = 1,  this.elevation = 3});
  final double elevation;
  final Widget child;
  final Color bgColor;
  final bool isBorderOn;
  final Color borderColor;
  final EdgeInsets padding;
  final double borderRadius;
  final double borderWidth;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
        color: bgColor,
        shape: RoundedRectangleBorder(
          side: isBorderOn
              ? BorderSide(color: borderColor, width: borderWidth)
              : const BorderSide(color: Colors.transparent, width: 0),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Container(padding: padding, child: child));
  }
}
