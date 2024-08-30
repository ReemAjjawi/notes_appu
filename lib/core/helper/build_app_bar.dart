import 'package:flutter/material.dart';

AppBar buildAppBar({
  Widget? leadingg,
  bool hasLeading = false,
  PreferredSize? bottom,
  Function()? onPressed,
  Widget? title,
}) {
  return AppBar(
    backgroundColor: Colors.white,
    leadingWidth: 100,
    leading: hasLeading
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(
                  Icons.adaptive.arrow_back,
                  size: 15,
                ),
                onPressed: onPressed,
              ),
              const Text(
                "Back",
                style: TextStyle(
                  // fontWeight: FontWeight.w400,
                  fontSize: 15,
                  // height: 23 / 16,
                  color: Colors.black,
                ),
              )
            ],
          )
        : leadingg,
    centerTitle: true,
    title: title,
    bottom: bottom,
  );
}
