import 'package:flutter/material.dart';

import '../../core/helper/build_app_bar.dart';
import '../../core/resources/managers/assets_manager.dart';
import '../../core/resources/managers/colors_manager.dart';
import '../../core/resources/managers/strings_manager.dart';
import '../../core/resources/managers/styles_manager.dart';
import '../../core/widgets/app_button.dart';
import '../../core/widgets/app_list_tile.dart';
import '../../main.dart';

class WalletScreen extends StatelessWidget {
  WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
      leadingg: Container(
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
      // actions: [
      //   Icon(Icons.notifications_outlined),
      // ],
    ),
      body: _buildBody(),
    );
  }

 
  Widget _buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        _buildSizeBox(screenHeight),
        _buildAppButton(screenWidth, screenHeight),
        _buildSizeBox(screenHeight),
        if (isPortrait) _buildRow(screenWidth, screenHeight),
        if (!isPortrait) _buildRowLandscape(screenWidth, screenHeight),
        _buildSizeBox(screenHeight),
        _buildRow2(),
        _buildSizeBox(screenHeight),
        _buildListView(screenHeight),
      ],
    );
  }

  Widget _buildSizeBox(double screenHeight) {
    return SizedBox(height: screenHeight * 0.02);
  }

  Widget _buildAppButton(double screenWidth, double screenHeight) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AppButton(
        text: StringsManager.ADDMONEY,
        onPressed: wiee,
        backgroundColor: ColorManager.whiteColor,
        width: screenWidth * 0.44,
        height: screenHeight / 15,
        textStyle: StylesManager.whiteButtonStyle,
        hasIcon: false,
      ),
    );
  }

  Widget _buildRow(double screenWidth, double screenHeight) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
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
                  style: StylesManager.headLineStyle,
                ),
                SizedBox(height: screenHeight * 0.01),
                const Text(
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
                const Text(
                  StringsManager.TOTALEXPEND,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRowLandscape(double screenWidth, double screenHeight) {
    return Column(
      children: [
        _buildRow(screenWidth, screenHeight),
        SizedBox(height: screenHeight * 0.02),
        _buildRow(screenWidth, screenHeight),
      ],
    );
  }

  Widget _buildRow2() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          StringsManager.TRANSECTIONS,
          style: StylesManager.headLineStyle,
        ),
        Text(
          StringsManager.SEEALL,
          style: StylesManager.whiteButtonStyle,
        ),
      ],
    );
  }

  Widget _buildListView(double screenHeight) {
    final List<Map<String, String>> wallet = [
      {
        'Image': AssetsManager.upImage,
        'name': StringsManager.WELTON,
        'date': StringsManager.TOMORROWATHOUR,
        'price': StringsManager.WELTONNUMBER
      },
      {
        'Image': AssetsManager.downImage,
        'name': StringsManager.NATHSAM,
        'date': StringsManager.TOMORROWATHOUR,
        'price': StringsManager.NATHSAMNUMBER
      },
      {
        'Image': AssetsManager.upImage,
        'name': StringsManager.WELTON,
        'date': StringsManager.TOMORROWATHOUR,
        'price': StringsManager.WELTONNUMBER
      },
      {
        'Image': AssetsManager.downImage,
        'name': StringsManager.NATHSAM,
        'date': StringsManager.TOMORROWATHOUR,
        'price': StringsManager.NATHSAMNUMBER
      },
      {
        'Image': AssetsManager.upImage,
        'name': StringsManager.WELTON,
        'date': StringsManager.TOMORROWATHOUR,
        'price': StringsManager.WELTONNUMBER
      },
      {
        'Image': AssetsManager.downImage,
        'name': StringsManager.NATHSAM,
        'date': StringsManager.TOMORROWATHOUR,
        'price': StringsManager.NATHSAMNUMBER
      },
      {
        'Image': AssetsManager.upImage,
        'name': StringsManager.WELTON,
        'date': StringsManager.TOMORROWATHOUR,
        'price': StringsManager.WELTONNUMBER
      },
    ];

    return Expanded(
      child: ListView.builder(
        itemCount: wallet.length,
        itemBuilder: (context, index) {
          return Card(
            child: CustomListTile(
              leading: Image(image: AssetImage(wallet[index]['Image']!)),
              title: Text(wallet[index]['name']!,
                  style: StylesManager.titleTextStyle),
              subtitle: Text(wallet[index]['date']!,
                  style: StylesManager.subTitleStyle),
              trailing: Text(wallet[index]['price']!,
                  style: StylesManager.titleTextStyle),
              backgroundColor: Colors.white,
              borderColor: Colors.grey,
              height: screenHeight / 7,
              width: double.infinity,
              hasrawtitle: false,
              hasrawsubtitle: false,
              hascolum: false,
            ),
          );
        },
      ),
    );
  }

  void wiee() {}
}
