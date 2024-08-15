import 'package:flutter/material.dart';
import 'package:ride_application/core/resources/managers/assets_manager.dart';
import 'package:ride_application/core/resources/managers/colors_manager.dart';
import 'package:ride_application/core/resources/managers/strings_manager.dart';
import 'package:ride_application/core/resources/managers/styles_manager.dart';
import 'package:ride_application/core/widgets/app_button.dart';
import 'package:ride_application/core/widgets/app_text_field.dart';
import 'package:ride_application/main.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AssetsManager.welcomeImage,
              width: screenWidth * 0.8,
              height: screenHeight * 0.3,
            ),
            SizedBox(height: screenHeight * 0.04),
            Text(
              StringsManager.WELCOME,
              style: StylesManager.headLineStyle,
            ),
            SizedBox(height: screenHeight * 0.01),
            Text(
              StringsManager.SUBWELCOME,
              style: StylesManager.subLineStyle,
            ),
            SizedBox(height: screenHeight * 0.27),
            Center(
              child: AppButton(
                text: StringsManager.CREATEANACCOUNT,
                onPressed: () {
                   Navigator.pushNamed(context, '/SignUp');
              },
                backgroundColor: ColorManager.primaryColor,
                width: screenWidth * 0.88,
                height: screenHeight / 16.5,
                textStyle: StylesManager.greenButtonStyle,
              hasIcon: false,
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            AppButton(
              text: StringsManager.LOGIN,
              onPressed: (){},
              backgroundColor: ColorManager.whiteColor,
              width: screenWidth * 0.88,
              height: screenHeight / 15,
              textStyle:StylesManager.whiteButtonStyle,
            hasIcon: false,
            ),
        
          ],
        ),
      
    );
  }
}
