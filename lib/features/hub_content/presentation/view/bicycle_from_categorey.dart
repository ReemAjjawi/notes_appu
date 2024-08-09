// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:ride_application/core/helper/build_app_bar.dart';
import 'package:ride_application/core/resources/managers/assets_manager.dart';
import 'package:ride_application/core/resources/managers/colors_manager.dart';
import 'package:ride_application/core/resources/managers/strings_manager.dart';
import 'package:ride_application/core/resources/managers/styles_manager.dart';
import 'package:ride_application/core/widgets/app_button.dart';
import 'package:ride_application/core/widgets/app_list_tile.dart';
import 'package:ride_application/main.dart';

class BicyclesFromCategorey extends StatelessWidget {
  int hubId;
  String categoryName;
   BicyclesFromCategorey({
    Key? key,
    required this.hubId,
    required this.categoryName,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {

     return Scaffold(
     appBar: _buildAppBar(context),
      body:  _buildBody(),
    );
  }
}
 PreferredSizeWidget _buildAppBar(BuildContext context) {
    return buildAppBar(
        hasLeading: true,
        onPressed:  () => _onAppBarPressed(context),
      );
  }
   Widget _buildBody() {
    return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildText(),
          _buildSizeBox(),
          _buildText2(),
          _buildSizeBox(),
          _buildListView(),
      
        ],
      ),);
  }

   Widget _buildText() {
    return  Text(
                StringsManager.AVAIABLECARSFORRIDE,
                style: StylesManager.titleTextStyle,
              );
  }
   Widget _buildSizeBox() {
    return  SizedBox(height: screenHeight * 0.02);
  }
  Widget _buildText2() {
    return Text(
                StringsManager.CARSFOUND,
                style: StylesManager.subTitleStyle,
              
            );
  }
  Widget _buildListView(){
    final List<String> cars = [
    StringsManager.BMWCABRIO,
    StringsManager.MUSTANGSHELBYGT,
    StringsManager.BMW18,
    StringsManager.JAGUARSILBER,
  ];

    return  ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: cars.length,
              itemBuilder: (context, index) {
                final car = cars[index];
                return Card(
                  child: CustomListTile(
                    height: screenHeight * 0.35,
                    width: double.infinity,
                    backgroundColor: ColorManager.scondaryColor,
                    borderColor: ColorManager.borderColor,
                    hasrawsubtitle: false,
                    hasrawtitle: false,
                    hascolum: true,
                    title: Text(
                      car,
                      style: StylesManager.titleTextStyle,
                    ),
                    subtitle: Text(
                      StringsManager.INFOCAR,
                      style: StylesManager.subTitleStyle,
                    ),
                    subtitle2: Text(""),
                    subtitle3: Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: ColorManager.underHintTextColor,
                        ),
                        SizedBox(width: screenWidth * 0.01),
                        Text(
                          StringsManager.DESTANCE,
                          style: StylesManager.underHintTextStyle,
                        ),
                      ],
                    ),
                    trailing: Container(
                      width: screenWidth * 0.25,
                      height: screenHeight * 0.8,
                      child: Image.asset(
                        AssetsManager.bmwImage,
                       // fit: BoxFit.cover,
                      ),
                    ),
                    subtitle4: AppButton(
                      text: StringsManager.BOOKLATER,
                      onPressed: wiee,
                      backgroundColor: ColorManager.scondaryColor,
                      width: screenWidth * 0.44,
                      height: screenHeight / 15,
                      textStyle: StylesManager.whiteButtonStyle,
                      hasIcon: false,
                    ),
                    subtitle5: AppButton(
                      text: StringsManager.RIDENOW,
                      onPressed: wiee,
                      backgroundColor: ColorManager.primaryColor,
                      width: screenWidth * 0.44,
                      height: screenHeight / 15,
                      textStyle: StylesManager.greenButtonStyle,
                      hasIcon: false,
                    ),
                  ),
                );
              },
            );
  }







  void _onAppBarPressed(context) {
    Navigator.of(context).pop();
  } 
 
 wiee() {
 }
 