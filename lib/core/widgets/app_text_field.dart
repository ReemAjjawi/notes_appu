import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String hintText;
  final TextStyle? textStyleHintText;
  final Color? backgroundColor;
  final FormFieldValidator<String>? validator;
  final bool? filledbool;
  final TextStyle? textStyle;
  final Widget? suffixIconIcon;
  final Color? suffixIcoColor;
  final IconData? prefixIconIcon;
  final Color? prefixIconColor;
  final Color colorborder;
  final double width;
  final double height;
  final bool? obscureText;

  CustomTextFormField({
    Key? key,
    this.controller,
    this.keyboardType,
    required this.hintText,
    this.validator,
    this.filledbool,
    this.backgroundColor,
    this.textStyle,
    this.textStyleHintText,
    this.suffixIconIcon,
    this.prefixIconIcon,
    this.suffixIcoColor,
    this.prefixIconColor,
    this.obscureText,
    required this.colorborder,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText ?? false,
        decoration: InputDecoration(
          filled: filledbool,
          fillColor: backgroundColor,
          hintText: hintText,
          hintStyle: textStyleHintText,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: colorborder),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: colorborder),
          ),
          suffixIcon: suffixIconIcon,
          prefixIcon: Icon(
              prefixIconIcon,
              color: prefixIconColor,
            )),
        validator: validator,
        style: textStyle,
      ),
    );
  }
}
