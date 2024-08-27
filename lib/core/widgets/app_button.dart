import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ride_application/main.dart';

class AppButton extends StatelessWidget {
  final String text;
  final bool hasIcon;
  final Function() onPressed;
  final Color backgroundColor;
  final Color? bordergroundColor;
  final double width;
  final double height;
  final TextStyle textStyle;
  final String? img;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.backgroundColor,
    this.bordergroundColor,
    required this.width,
    required this.height,
    required this.textStyle,
    required this.hasIcon,
    this.img,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height,
        width: width,
        child:
            // isios?
            // CupertinoButton( child: child, onPressed: onPressed)
            ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              side: BorderSide(
                color: bordergroundColor ?? const Color(0xff008955),
              ),
            ),
          ),
          onPressed: onPressed,
          child: hasIcon
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Image.asset(
                        img!,
                        width: screenWidth * 0.05,
                        height: screenHeight * 0.05,
                      ),
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
