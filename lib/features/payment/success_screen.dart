import 'package:flutter/material.dart';
import 'package:ride_application/core/resources/managers/colors_manager.dart';
import 'package:ride_application/core/resources/managers/styles_manager.dart';
import 'package:ride_application/core/widgets/app_button.dart';
import '../../core/resources/managers/assets_manager.dart';
import '../../core/resources/managers/strings_manager.dart';
import '../../main.dart';

class SuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context, screenWidth, screenHeight, isPortrait),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(StringsManager.AMOUNT),
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () => _onAppBarPressed(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context, double screenWidth, double screenHeight, bool isPortrait) {
    return _buildAppButton(context, screenWidth, screenHeight, isPortrait);
  }

  Widget _buildAppButton(BuildContext context, double screenWidth, double screenHeight, bool isPortrait) {
    return Center(
      child: AppButton(
        text: StringsManager.SHOWSUCCESSDIALOG,
        backgroundColor: ColorManager.borderColor,
        width: isPortrait ? screenWidth * 0.92 : screenWidth * 0.6,
        height: screenHeight / (isPortrait ? 15 : 10),
        textStyle: StylesManager.greenButtonStyle,
        hasIcon: false,
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return SuccessDialog(
                screenWidth: screenWidth,
                screenHeight: screenHeight,
                isPortrait: isPortrait,
              );
            },
          );
        },
      ),
    );
  }

  void _onAppBarPressed(BuildContext context) {
    Navigator.of(context).pop();
  }
}

class SuccessDialog extends StatelessWidget {
  final double screenWidth;
  final double screenHeight;
  final bool isPortrait;
  SuccessDialog({
    required this.screenWidth,
    required this.screenHeight,
    required this.isPortrait,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        width: isPortrait ? screenWidth * 0.8 : screenWidth * 0.6,
        constraints: BoxConstraints(
          maxHeight: screenHeight * 0.8,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildSuccessImage(),
                    _buildSuccessTitle(),
                    _buildSubTitle(),
                    _buildAmountInfo(),
                    _buildBackButton(context),
                   _buildSizeBox(screenHeight),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSuccessImage() {
    return Column(
      children: [
        SizedBox(height: screenHeight * 0.02),
        Image.asset(
          AssetsManager.successImage,
          height: screenHeight * (isPortrait ? 0.12 : 0.2),
          fit: BoxFit.cover,
        ),
        SizedBox(height: screenHeight * 0.02),
      ],
    );
  }

  Widget _buildSuccessTitle() {
    return Text(
      StringsManager.ADDSUCCESS,
      style: StylesManager.headLineStyle,
    );
  }

  Widget _buildSubTitle() {
    return Column(
      children: [
        SizedBox(height: screenHeight * 0.01),
        Text(
          StringsManager.SUBADDSUCCESS,
          textAlign: TextAlign.center,
          style: StylesManager.subTitleStyle,
        ),
        SizedBox(height: screenHeight * 0.02),
      ],
    );
  }

  Widget _buildAmountInfo() {
    return Column(
      children: [
        Text(
          StringsManager.AMOUNT,
          style: StylesManager.titleTextStyle,
        ),
        SizedBox(height: screenHeight * 0.01),
        Text(
          StringsManager.AMOUNTINFO,
          style: StylesManager.headLineStyle,
        ),
        SizedBox(height: screenHeight * 0.02),
      ],
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return AppButton(
      text: StringsManager.BACKHOME,
      onPressed: () {
        Navigator.pushNamed(context, '/HomeScreen');
      },
      backgroundColor: ColorManager.primaryColor,
      width: isPortrait ? screenWidth * 0.5 : screenWidth * 0.3,
      height: screenHeight / (isPortrait ? 15 : 10),
      textStyle: StylesManager.greenButtonStyle,
      hasIcon: false,
    );
  }
}


  Widget _buildSizeBox(double screenHeight) {
    return SizedBox(height: screenHeight * 0.03);
  }
