import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  final bool hasicon;
  final Function() onPressed;
  final Color backgroundColor;
  final Color? bordergroundColor;
  final double width;
  final double height;
  final TextStyle textStyle;
  final IconData? icon;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.backgroundColor,
    this.bordergroundColor,
    required this.width,
    required this.height,
    required this.textStyle,
    required this.hasicon,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height,
        width: width,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              side: BorderSide(
                color: bordergroundColor ?? const Color(0xff008955),
                width: 2.0,
              ),
            ),
          ),
          onPressed: onPressed,
          child: hasicon
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(icon),
                    ),
                    Text(
                      text,
                      style: textStyle,
                    ),
                  ],
                )
              : Text(
                  text,
                  style: textStyle,
                ),
        ));
  }
}
