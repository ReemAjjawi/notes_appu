// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final Widget? title;
  final Widget? title2;

  final TextStyle? textStyletitle;

  final Widget? subtitle;
  final bool hasrawsubtitle;
  final bool hasrawtitle;
  final bool hascolum;

  final Widget? subtitle2;
  final Widget? subtitle3;
    final Widget? subtitle4;


  final Widget? leading;

  final Widget? trailing;
  final Color? backgroundColor;
  final Color borderColor;

  final double height;
  final double width;

  final VoidCallback? onTap;

  const CustomListTile({
    Key? key,
    this.title,
    this.textStyletitle,
    this.subtitle,
    required this.hasrawsubtitle,
    this.leading,
    this.trailing,
    this.backgroundColor,
    required this.borderColor,
    required this.height,
    required this.width,
    this.onTap,
    this.title2,
    this.subtitle2,
    required this.hasrawtitle,
    required this.hascolum, this.subtitle3, this.subtitle4,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(color: borderColor, width: 1.0),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: leading,
        title: hasrawtitle
            ? Row(
                children: [
                  title!,
                  SizedBox(width: 8.0),
                  title2!,
                ],
              )
            : title,
        subtitle: hasrawsubtitle
            ? Row(
                children: [
                  subtitle!,
                  SizedBox(width: 8.0),
                  subtitle2!,
                ],
              )
            : hascolum
                ? Column(
                    children: [
                      Row(
                        children: [
                          subtitle!,
                          SizedBox(width: 8.0),
                          subtitle2!,
                        ],
                      ),
                      Row(
                        children: [
                          subtitle3!,
                          SizedBox(width: 8.0),
                          subtitle4!,
                        ],
                      ),
                    ],
                  )
                : subtitle,
        trailing: trailing,
        onTap: onTap,
      ),
    );
  }
}
