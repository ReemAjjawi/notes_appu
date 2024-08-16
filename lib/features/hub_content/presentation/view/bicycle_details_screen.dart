// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:ride_application/core/helper/build_app_bar.dart';
import 'package:ride_application/core/resources/managers/assets_manager.dart';
import 'package:ride_application/core/resources/managers/colors_manager.dart';
import 'package:ride_application/core/resources/managers/strings_manager.dart';
import 'package:ride_application/core/resources/managers/styles_manager.dart';
import 'package:ride_application/core/widgets/app_button.dart';
import 'package:ride_application/core/widgets/app_list_tile.dart';
import 'package:ride_application/features/hub_content/data/model/second_model.dart';
import 'package:ride_application/main.dart';

import '../../../map/data/model/hubinfo_model.dart';

class DetailArguments {
  final BicycleListModel bicycle;
  final HubinfoModel hubId;
  final HubinfoModel hubIdto;

  DetailArguments({
    required this.bicycle,
    required this.hubId,
    required this.hubIdto,
  });
}

class BicycleDetailsScreen extends StatelessWidget {
  BicycleListModel bicycle;
  HubinfoModel hubId;
  HubinfoModel hubIdto;
  BicycleDetailsScreen({
    Key? key,
    required this.bicycle,
    required this.hubId,
    required this.hubIdto,
  }) : super(key: key);
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
      onPressed: () => _onAppBarPressed(context),
    );
  }

  Widget _buildBody(double screenWidth, double screenHeight) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildText(),
              _buildRow(screenWidth),
              _buildSizeBox(screenHeight),
              _buildImage(screenWidth, screenHeight),
            ],
          ),
          _buildSizeBox(screenHeight),
          _buildText2(),
          _buildSizeBox(screenHeight),
          _buildRow2(screenWidth, screenHeight),
          _buildSizeBox(screenHeight),
          _buildText3(),
          _buildSizeBox(screenHeight),
          _buildListTile(screenWidth, screenHeight),
          _buildSizeBox(screenHeight),
          _buildRow3(screenWidth, screenHeight),
          _buildSizeBox(screenHeight),
        ],
      ),
    );
  }

  Widget _buildText() {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: Text(
        bicycle.type,
        style: StylesManager.headLineStyle,
      ),
    );
  }

  Widget _buildRow(double screenWidth) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(Icons.star, color: ColorManager.starColor),
          SizedBox(width: screenWidth * 0.01),
          Text(
            StringsManager.REVIEWS,
            style: StylesManager.subTitleStyle,
          ),
        ],
      ),
    );
  }

  Widget _buildSizeBox(double screenHeight) {
    return SizedBox(height: screenHeight * 0.02);
  }

  Widget _buildImage(double screenWidth, double screenHeight) {
    return Center(
      child: Image.asset(
        AssetsManager.bmwRedImage,
        height: screenHeight * 0.25,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildText2() {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: Text(StringsManager.SPECIFICATIONS,
          style: StylesManager.headLineStyle),
    );
  }

  Widget _buildText3() {
    return Padding(
      padding: EdgeInsets.all(padding),
      child:
          Text(StringsManager.CARFEATURES, style: StylesManager.headLineStyle),
    );
  }

  Widget _buildRow2(double screenWidth, double screenHeight) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildSpecificationItem(
            AssetsManager.maxPowerImage,
            StringsManager.MAXPOWER,
            StringsManager.HP,
            screenWidth,
            screenHeight),
        _buildSpecificationItem(AssetsManager.fualImage, StringsManager.FUEL,
            StringsManager.KMPERLITRE, screenWidth, screenHeight),
        _buildSpecificationItem(
            AssetsManager.speedImage,
            StringsManager.MAXSPEED,
            StringsManager.PH,
            screenWidth,
            screenHeight),
        _buildSpecificationItem(AssetsManager.mphImage, StringsManager.MPH,
            StringsManager.SEC, screenWidth, screenHeight),
      ],
    );
  }

  Widget _buildListTile(double screenWidth, double screenHeight) {
    return Column(
      children: [
        _buildFeatureItem(
            StringsManager.MODEL, StringsManager.GT, screenWidth, screenHeight),
        _buildFeatureItem(StringsManager.CAPACITY, StringsManager.HP,
            screenWidth, screenHeight),
        _buildFeatureItem(StringsManager.COLOR, StringsManager.RED, screenWidth,
            screenHeight),
        _buildFeatureItem(StringsManager.FUELTYPE, StringsManager.OCTAN,
            screenWidth, screenHeight),
        _buildFeatureItem(StringsManager.GEARTYPE, StringsManager.AUTOMATIC,
            screenWidth, screenHeight),
      ],
    );
  }

  Widget _buildSpecificationItem(String image, String title, String value,
      double screenWidth, double screenHeight) {
    return Flexible(
      child: Container(
        height: screenHeight / 4,
        width: screenWidth * 0.22,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: ColorManager.borderColor,
          ),
          color: ColorManager.scondaryColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              height: screenHeight * 0.04,
            ),
            SizedBox(height: screenHeight * 0.001),
            Text(title, style: StylesManager.titleNotificationStyle),
            SizedBox(height: screenHeight * 0.0005),
            Text(value, style: StylesManager.subTitleNotificationStyle),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureItem(
      String feature, String value, double screenWidth, double screenHeight) {
    return Center(
      child: Card(
        child: CustomListTile(
          hasrawsubtitle: false,
          borderColor: ColorManager.borderColor,
          width: screenWidth * 0.88,
          height: screenHeight / 15,
          hascolum: false,
          hasrawtitle: true,
          title: Text(feature),
          title2: Text(value),
          backgroundColor: ColorManager.scondaryColor,
        ),
      ),
    );
  }

  Widget _buildRow3(double screenWidth, double screenHeight) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        AppButton(
          text: StringsManager.BOOKLATER,
          onPressed: wiee,
          backgroundColor: ColorManager.whiteColor,
          width: screenWidth * 0.44,
          height: screenHeight / 15,
          textStyle: StylesManager.whiteButtonStyle,
          hasIcon: false,
        ),
        Builder(builder: (context) {
          return AppButton(
            text: StringsManager.RIDENOW,
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/ReservationScreen',
                arguments: DetailArguments(
                  bicycle: bicycle,
                  hubId: hubId,
                  hubIdto: hubIdto,
                ),
              );
            },
            backgroundColor: ColorManager.primaryColor,
            width: screenWidth * 0.44,
            height: screenHeight / 15,
            textStyle: StylesManager.greenButtonStyle,
            hasIcon: false,
          );
        }),
      ],
    );
  }

  void _onAppBarPressed(context) {
    Navigator.of(context).pop();
  }

  wiee() {}
}
