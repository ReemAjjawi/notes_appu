import 'package:flutter/material.dart';

import '../../../../core/helper/build_app_bar.dart';
import '../../../../core/resources/managers/colors_manager.dart';
import '../../../../core/resources/managers/strings_manager.dart';
import '../../../../core/resources/managers/styles_manager.dart';
import '../../../../core/widgets/app_list_tile.dart';
import '../../../../main.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context, screenWidth, screenHeight),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return buildAppBar(
      hasLeading: true,
      title: Text(StringsManager.SETTINGS),
      onPressed: () => _onAppBarPressed(context),
    );
  }

  Widget _buildBody(
      BuildContext context, double screenWidth, double screenHeight) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: ListView(
        children: [
          _buildSettingsOption(() {
            Navigator.pushNamed(
              context,
              '/ChangePasswordScreen',
            );
          }, context, StringsManager.CHARGEPASSWORD, screenWidth, screenHeight),
          SizedBox(height: screenHeight * 0.02),
          _buildSettingsOption(() {
            Navigator.pushNamed(
              context,
              '/ChangeLanguageScreen',
            );
          }, context, StringsManager.CHARGELANGUAGE, screenWidth, screenHeight),
          SizedBox(height: screenHeight * 0.02),
          _buildSettingsOption(() {
            Navigator.pushNamed(
              context,
              '/PrivacyPolicyScreen',
            );
          }, context, StringsManager.PRIVACYPOLICY, screenWidth, screenHeight),
          SizedBox(height: screenHeight * 0.02),
          _buildSettingsOption(() {
            Navigator.pushNamed(
              context,
              '/ContactUsScreen',
            );
          }, context, StringsManager.CONTACTUS, screenWidth, screenHeight),
          SizedBox(height: screenHeight * 0.02),
          _buildSettingsOption(() {
            Navigator.pushNamed(
              context,
              '/DeleteAccountScreen',
            );
          }, context, StringsManager.DELETEACCOUNT, screenWidth, screenHeight),
        ],
      ),
    );
  }

  Widget _buildSettingsOption(onTap, BuildContext context, String title,
      double screenWidth, double screenHeight) {
    return GestureDetector(
      onTap: onTap,
      child: CustomListTile(
        hasrawsubtitle: false,
        borderColor: ColorManager.borderColor,
        width: screenWidth * 0.88,
        height: screenHeight / 14,
        hascolum: false,
        hasrawtitle: false,
        title: Text(title),
        textStyletitle: StylesManager.headLineStyle,
        trailing: Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}

void _onAppBarPressed(context) {
  Navigator.of(context).pop();
}
