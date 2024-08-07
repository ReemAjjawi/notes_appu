import 'package:flutter/material.dart';

AppBar buildAppBar({
  Widget? leadingg,
  bool hasLeading = false,
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
                icon: const Icon(
                  Icons.arrow_back_ios_new_sharp,
                  size: 20,
                ),
                onPressed: onPressed,
              ),
              const Text(
                "Back",
                style: TextStyle(
                  // fontWeight: FontWeight.w400,
                  fontSize: 20,
                  // height: 23 / 16,
                  color: Colors.black,
                ),
              )
            ],
          )
        : leadingg,
    centerTitle: true,
    title: title,
  );
}
