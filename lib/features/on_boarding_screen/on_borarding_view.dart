import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ride_application/core/resources/managers/colors_manager.dart';
import 'package:ride_application/core/widgets/app_button.dart';
import 'package:ride_application/core/widgets/app_text_field.dart';
import 'package:ride_application/main.dart';

import '../../core/resources/managers/assets_manager.dart';
import '../../core/resources/managers/strings_manager.dart';
gt(){

}
class OnBoardingView extends StatelessWidget {
  const OnBoardingView(
      {super.key,
      required this. progress,

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Align(
              alignment: Alignment.topRight,
              child: Text(StringsManager.SKIP)
            ),
          ),
          Container(
         
         //   clipBehavior: Clip.hardEdge,
            width: screenWidth*0.9,
            height: screenHeight/4,
            child: Image.asset(
              image,
            ),
          ),
          Text(
            headLine,
            style: TextStyle(),
          ),

              Text(titleText
            ,
            style: TextStyle(),
          ),
   Container(
         
         //   clipBehavior: Clip.hardEdge,
            width: screenWidth/13,
            height: screenHeight/10,
            child: Image.asset(
              progress,
            ),
          ),
      
        ]
                ),
              );
           
}}




PageController onBoardingContoller = PageController();

class HomePage extends StatelessWidget {
   HomePage({super.key});
TextStyle gg=TextStyle();
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
        children:  [
          OnBoardingView(
            

           image:AssetsManager.taxiStartImage,
 progress:AssetsManager.startImage,
   headLine:StringsManager.ANYWHEREYOUARE,
 titleText:StringsManager.SELLHOUSES,
 index:0
),

          OnBoardingView(
           image:AssetsManager.orderImage,
 progress:AssetsManager.middleImage,
   headLine:StringsManager.ATANYTIME,
 titleText:StringsManager.SELLHOUSES,
 index: 1),
         OnBoardingView(
           image:AssetsManager.mapImage,
 progress:AssetsManager.completeImage,
   headLine:StringsManager.BOOKYOURCAR,
 titleText:StringsManager.SELLHOUSES,
 index: 2),
        Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                            Center(child: CustomTextFormField(hintText: StringsManager.FULLNAME, colorborder: ColorManager.subLineColor, width: screenWidth*0.92, height: screenHeight/15))

,AppButton(text: StringsManager.SIGNUP, onPressed:gt , backgroundColor: ColorManager.primaryColor, width: screenWidth*0.88, height: screenHeight/16.5, textStyle: gg, hasicon: false)            ],
          ),
        )
        ],
      ),
    );
  }
}
