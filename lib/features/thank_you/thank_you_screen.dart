import 'package:flutter/material.dart';
import 'package:ride_application/core/helper/build_app_bar.dart';
import 'package:ride_application/core/resources/managers/assets_manager.dart';
import 'package:ride_application/core/resources/managers/colors_manager.dart';
import 'package:ride_application/core/resources/managers/strings_manager.dart';
import 'package:ride_application/core/resources/managers/styles_manager.dart';
import 'package:ride_application/core/widgets/app_button.dart';
import 'package:ride_application/main.dart';

class ThankYouScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: _buildAppBar(context),
        body:  _buildBody(),
        ),
    );
  }
}

PreferredSizeWidget _buildAppBar(BuildContext context) {
  return buildAppBar(
    hasLeading: true,
    onPressed: () => _onAppBarPressed(context),
  );
}
Widget _buildBody() {
    return Column(
       crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildSpacer(),
          _buildImage(),
          _buildSizeBox(),
          _buildText(),
          _buildSizeBox(),
          _buildText2(),
          _buildSpacer(),
          _buildSpacer(),
          _buildAppButton(),
          _buildSizeBox(),
        ],
      );
  }

   Widget _buildSpacer() {
    return Spacer();
  }
  Widget _buildImage() {
    return  Image.asset(
                AssetsManager.successImage,
                height: screenHeight * 0.12);
  }
   Widget _buildSizeBox() {
    return  SizedBox(height: screenHeight * 0.02);
  }
   Widget _buildText() {
    return  Text(
                StringsManager.THANKYOU,
                style: StylesManager.headLineStyle,
              );
  }
   Widget _buildText2() {
    return Text(
                StringsManager.SUBTHANKYOU,
                textAlign: TextAlign.center,
                style: StylesManager.titleNotificationStyle,
              );
  }
  Widget _buildAppButton() {
    return  Center(
                child: AppButton(
                  text: StringsManager.CONFIRMRIDE,
                  onPressed: () {
                  },
                  backgroundColor: ColorManager.primaryColor,
                  width: screenWidth * 0.88,
                  height: screenHeight / 16.5,
                  textStyle: TextStyle(color: ColorManager.whiteColor),
                  hasIcon: false,
                ),
              );
  }

void _onAppBarPressed(context) {
  Navigator.of(context).pop();
}
