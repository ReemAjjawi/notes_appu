import 'package:flutter/material.dart';

import '../../core/resources/managers/assets_manager.dart';
import '../../core/resources/managers/strings_manager.dart';
import '../auth/presentation/view/welcome_screen.dart';
import 'on_borarding_screen.dart';

PageController onBoardingContoller = PageController();
   List  pages = [
    OnBoardingScreen(
              image: AssetsManager.taxiStartImage,
              progress: AssetsManager.startImage,
              headLine: StringsManager.ANYWHEREYOUARE,
              titleText: StringsManager.SELLHOUSES,
              index: 0),
          OnBoardingScreen(
              image: AssetsManager.orderImage,
              progress: AssetsManager.middleImage,
              headLine: StringsManager.ATANYTIME,
              titleText: StringsManager.SELLHOUSES,
              index: 1),
          OnBoardingScreen(
              image: AssetsManager.mapImage,
              progress: AssetsManager.completeImage,
              headLine: StringsManager.BOOKYOURCAR,
              titleText: StringsManager.SELLHOUSES,
              index: 2),
  ];
class HomePage extends StatelessWidget {
  HomePage({super.key});
  TextStyle gg = TextStyle();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: onBoardingContoller,
        // onPageChanged: (value) {
        //   print(value);
        // },
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
      pages[0],
      pages[1],
      pages[2],
           WelcomeScreen()
        ],
      ),
 
    );
  }
}















