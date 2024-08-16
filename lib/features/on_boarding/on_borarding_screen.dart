import 'package:flutter/material.dart';

import '../../core/resources/managers/strings_manager.dart';
import '../../main.dart';

gt() {}

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen(
      {super.key,
      required this.progress,
      required this.image,
      required this.headLine,
      required this.titleText,
      required this.index});

  final String image;
  final String progress;
  final String headLine;
  final String titleText;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        const Padding(
          padding: EdgeInsets.only(right: 10.0),
          child: Align(
              alignment: Alignment.topRight, child: Text(StringsManager.SKIP)),
        ),
        SizedBox(
          //   clipBehavior: Clip.hardEdge,
          width: screenWidth * 0.9,
          height: screenHeight / 4,
          child: Image.asset(
            image,
          ),
        ),
        Text(
          headLine,
          style: TextStyle(),
        ),
        Text(
          titleText,
          style: TextStyle(),
        ),
        SizedBox(
          //   clipBehavior: Clip.hardEdge,
          width: screenWidth / 13,
          height: screenHeight / 10,
          child: Image.asset(
            progress,
          ),
        ),
      ]),
    );
  }
}
