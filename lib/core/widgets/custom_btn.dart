import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  const CustomBtn(
      {super.key,
      required this.backgroundColor,
      required this.textColor,
      this.borderRadius,
      required this.textBtn,
      this.fontSize,
      this.onPressed});
  final Color backgroundColor;
  final Color textColor;
  final BorderRadius? borderRadius;
  final String textBtn;
  final double? fontSize;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 48,
        child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: backgroundColor,
              shape: RoundedRectangleBorder(
                  borderRadius: borderRadius ?? BorderRadius.circular(12)),
            ),
            onPressed: onPressed,
            child: Text(
              textBtn,
              style: Styles.textStyly18.copyWith(
                  color: textColor,
                  fontWeight: FontWeight.w900,
                  fontSize: fontSize),
            )));
  }
}
