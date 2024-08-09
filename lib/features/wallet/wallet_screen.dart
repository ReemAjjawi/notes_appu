import 'package:flutter/material.dart';
import 'package:ride_application/core/resources/managers/assets_manager.dart';
import 'package:ride_application/core/resources/managers/colors_manager.dart';
import 'package:ride_application/core/resources/managers/strings_manager.dart';
import 'package:ride_application/core/resources/managers/styles_manager.dart';
import 'package:ride_application/core/widgets/app_button.dart';
import 'package:ride_application/core/widgets/app_list_tile.dart';
import 'package:ride_application/main.dart';

class Wallet extends StatelessWidget {
  Wallet({super.key});

  final List<Map<String, String>> wallet = [
    {'Image': AssetsManager.upImage, 'name': StringsManager.WELTON, 'date': StringsManager.TOMORROWATHOUR, 'price': StringsManager.WELTONNUMBER},
    {'Image': AssetsManager.downImage, 'name': StringsManager.NATHSAM, 'date': StringsManager.TOMORROWATHOUR, 'price': StringsManager.NATHSAMNUMBER},
    {'Image': AssetsManager.upImage, 'name': StringsManager.WELTON, 'date': StringsManager.TOMORROWATHOUR, 'price': StringsManager.WELTONNUMBER},
    {'Image': AssetsManager.downImage, 'name': StringsManager.NATHSAM, 'date': StringsManager.TOMORROWATHOUR, 'price': StringsManager.NATHSAMNUMBER},
    {'Image': AssetsManager.upImage, 'name': StringsManager.WELTON, 'date': StringsManager.TOMORROWATHOUR, 'price': StringsManager.WELTONNUMBER},
    {'Image': AssetsManager.downImage, 'name': StringsManager.NATHSAM, 'date': StringsManager.TOMORROWATHOUR, 'price': StringsManager.NATHSAMNUMBER},
    {'Image': AssetsManager.upImage, 'name': StringsManager.WELTON, 'date': StringsManager.TOMORROWATHOUR, 'price': StringsManager.WELTONNUMBER},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          width: screenWidth * 0.1,
          height: screenWidth * 0.1,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            color: ColorManager.scondaryColor,
          ),
          child: const Icon(
            Icons.menu,
          ),
        ),
        actions: [
          Icon(Icons.notifications_outlined),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(height: screenHeight * 0.02),
          AppButton(
            text: StringsManager.ADDMONEY,
            onPressed: wiee,
            backgroundColor: ColorManager.whiteColor,
            width: screenWidth * 0.44,
            height: screenHeight / 15,
            textStyle: StylesManager.whiteButtonStyle,
            hasIcon: false,
          ),
          SizedBox(height: screenHeight * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: screenWidth * 0.4, 
                height: screenHeight * 0.18, 
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: ColorManager.scondaryColor,
                  border: Border.all(color: ColorManager.borderColor),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "\$500",
                      style:StylesManager.headLineStyle,
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Text(
                      StringsManager.AVAILABLEBALANCE,
                    ),
                  ],
                ),
              ),
              Container(
                width: screenWidth * 0.4,
                height: screenHeight * 0.18,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: ColorManager.scondaryColor,
                  border: Border.all(color: ColorManager.borderColor),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "\$200",
                      style: StylesManager.headLineStyle,
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Text(
                      StringsManager.TOTALEXPEND,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                StringsManager.TRANSECTIONS,
                style: StylesManager.headLineStyle
              ),
              Text(
                StringsManager.SEEALL,
                style: StylesManager.whiteButtonStyle
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.01),
          Expanded(
            child: ListView.builder(
              itemCount: wallet.length,
              itemBuilder: (context, index) {
                return Card(
                  child: CustomListTile(
                    leading: Image(image: AssetImage(wallet[index]['Image']!)),
                    title: Text(wallet[index]['name']!, style: StylesManager.titleTextStyle),
                    subtitle: Text(wallet[index]['date']!, style: StylesManager.subTitleStyle),
                    trailing: Text(wallet[index]['price']!, style: StylesManager.titleTextStyle),
                    backgroundColor: Colors.white,
                    borderColor: Colors.grey,
                    height: screenHeight * 0.1,
                    width: double.infinity,
                    hasrawtitle: false,
                    hasrawsubtitle: false,
                    hascolum: false,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  wiee() {}
}
