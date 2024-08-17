import 'package:flutter/material.dart';
import 'package:ride_application/main.dart';

import '../../../../core/helper/build_app_bar.dart';
import '../../../../core/resources/managers/colors_manager.dart';
import '../../../../core/resources/managers/strings_manager.dart';
import '../../../../core/resources/managers/styles_manager.dart';
import '../../../../core/widgets/app_button.dart';

class PrivacyPolicyScreen extends StatelessWidget {
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
      title: Text(StringsManager.PRIVACYPOLICY),
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
      _buildSizeBox(screenHeight),
      _buildText2(),
      _buildSizeBox2(screenHeight),
    ],
   );}
  );
}

Widget _buildSizeBox(double screenHeight) {
  return SizedBox(height: screenHeight * 0.02);
}
Widget _buildText() {
  return   Text(
                StringsManager.PRIVACYPOLICYFORRIDESHARE,
                style: StylesManager.headLineStyle,
              );
}
Widget _buildSizeBox2(double screenHeight) {
  return SizedBox(height: screenHeight * 0.03);
}
Widget _buildText2() {
  return      Text(
                StringsManager.SUBPRIVACYPOLICY,
                style: StylesManager.subLineStyle,
              );
}

  void _onAppBarPressed(context) {
    Navigator.of(context).pop();
  }
}
