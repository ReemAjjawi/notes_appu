import 'package:flutter/material.dart';

import '../../core/helper/build_app_bar.dart';
import '../../core/resources/managers/assets_manager.dart';
import '../../core/resources/managers/colors_manager.dart';
import '../../core/resources/managers/strings_manager.dart';
import '../../core/resources/managers/styles_manager.dart';
import '../../core/widgets/app_button.dart';
import '../../main.dart';

class ThankYouScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(screenWidth, screenHeight),
    );
  }
}

PreferredSizeWidget _buildAppBar(BuildContext context) {
  return buildAppBar(
    hasLeading: true,
    onPressed: () => _onAppBarPressed(context),
  );
}

Widget _buildBody(double screenWidth, double screenHeight) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      _buildSpacer(),
      _buildImage(screenHeight),
      _buildSizeBox(screenHeight),
      _buildText(),
      _buildSizeBox(screenHeight),
      _buildText2(),
      _buildSpacer(),
      _buildSpacer(),
      _buildAppButton(screenWidth, screenHeight),
      _buildSizeBox(screenHeight),
    ],
  );
}

Widget _buildSpacer() {
  return const Spacer();
}

Widget _buildImage(double screenHeight) {
  return Image.asset(
    AssetsManager.successImage,
    height: screenHeight * 0.12,
  );
}

Widget _buildSizeBox(double screenHeight) {
  return SizedBox(height: screenHeight * 0.02);
}

Widget _buildText() {
  return Text(
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

Widget _buildAppButton(double screenWidth, double screenHeight) {
  return Center(
    child: AppButton(
      text: StringsManager.CONFIRMRIDE,
      onPressed: () {},
      backgroundColor: ColorManager.primaryColor,
      width: screenWidth * 0.88,
      height: screenHeight / 16.5,
      textStyle: const TextStyle(color: ColorManager.whiteColor),
      hasIcon: false,
    ),
  );
}

void _onAppBarPressed(context) {
  Navigator.of(context).pop();
}
