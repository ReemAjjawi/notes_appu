import 'package:flutter/material.dart';
import 'package:ride_application/main.dart';

import '../../../../core/helper/build_app_bar.dart';
import '../../../../core/resources/managers/colors_manager.dart';
import '../../../../core/resources/managers/strings_manager.dart';
import '../../../../core/resources/managers/styles_manager.dart';
import '../../../../core/widgets/app_button.dart';

class DeleteAccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
       body: _buildBody(screenWidth, screenHeight),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return buildAppBar(
      hasLeading: true,
      title: Text(StringsManager.DELETEACCOUNT),
      onPressed: () => _onAppBarPressed(context),
    );
  }

  Widget _buildBody(double screenWidth, double screenHeight) {
  return  OrientationBuilder(
        builder: (context, orientation) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
      _buildSizeBox(screenHeight),
      _buildText(),
      _buildSizeBox2(screenHeight),
      _buildAppButton(screenWidth, screenHeight),
    ],
   );}
  );
}


Widget _buildSizeBox(double screenHeight) {
  return SizedBox(height: screenHeight * 0.02);
}
Widget _buildText() {
  return  Text(
                StringsManager.DELETEACCOUNTINFORMATION,
                style: StylesManager.subLineStyle,
                textAlign: TextAlign.center,
              );
}
Widget _buildSizeBox2(double screenHeight) {
  return SizedBox(height: screenHeight * 0.03);
}


Widget _buildAppButton(double screenWidth, double screenHeight) {
  return Center(
                child: AppButton(
                  text: StringsManager.DELETE,
                  onPressed: () {},
                  backgroundColor: ColorManager.deleteColor,
                  width: isPortrait ? screenWidth * 0.88 : screenWidth * 0.6,
                  height: isPortrait ? screenHeight / 15 : screenHeight / 10 ,
                  textStyle: StylesManager.deleteStyle,
                  hasIcon: false,
                ),
              );
}

  void _onAppBarPressed(context) {
    Navigator.of(context).pop();
  }
}
