import 'package:flutter/material.dart';
import 'package:ride_application/core/helper/build_app_bar.dart';
import 'package:ride_application/core/resources/managers/assets_manager.dart';
import 'package:ride_application/core/resources/managers/colors_manager.dart';
import 'package:ride_application/core/resources/managers/strings_manager.dart';
import 'package:ride_application/core/resources/managers/styles_manager.dart';
import 'package:ride_application/core/widgets/app_button.dart';
import 'package:ride_application/core/widgets/app_list_tile.dart';
import 'package:ride_application/core/widgets/app_text_field.dart';
import 'package:ride_application/main.dart';

class AddAmountScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: _buildAppBar(context),
       body:  _buildBody(screenWidth, screenHeight),
      ),
    );
  }

  Widget _buildListView(double screenHeight, double screenWidth) {
    final List<Map<String, String>> payment = [
      {'Image': AssetsManager.visaImage, 'name': StringsManager.VISANUMBER, 'date': StringsManager.SUBVISANUMBER},
      {'Image': AssetsManager.mastercardImage, 'name': StringsManager.VISANUMBER, 'date': StringsManager.SUBVISANUMBER},
      {'Image': AssetsManager.mailaddressImage, 'name': StringsManager.MAILADDRESS, 'date': StringsManager.SUBVISANUMBER},
      {'Image': AssetsManager.cashImage, 'name': StringsManager.CASH, 'date': StringsManager.SUBVISANUMBER},
    ];

    return Expanded(
      child: ListView.builder(
        itemCount: payment.length,
        itemBuilder: (context, index) {
          return Card(
            child: CustomListTile(
              leading: Image(image: AssetImage(payment[index]['Image']!)),
              title: Text(payment[index]['name']!, style: StylesManager.titleTextStyle),
              subtitle: Text(payment[index]['date']!, style: StylesManager.subTitleStyle),
              backgroundColor: ColorManager.scondaryColor,
              borderColor: ColorManager.borderColor,
              height: screenHeight * 0.1,
              width: screenWidth,
              hasrawtitle: false,
              hasrawsubtitle: false,
              hascolum: false,
            ),
          );
        },
      ),
    );
  }



  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return buildAppBar(
      hasLeading: true,
      title: Text(StringsManager.AMOUNT),
      onPressed: () => _onAppBarPressed(context),
    );
  }
   Widget _buildBody(double screenWidth, double screenHeight) {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSizeBox2(screenHeight),
            _buildTextFormField(),
            _buildSizeBox(screenHeight),
            _buildTextButton(),
            _buildSizeBox2(screenHeight),
            _buildText(),
            _buildSizeBox(screenHeight),
            _buildListView(screenHeight, screenWidth),
             _buildSizeBox2(screenHeight),
              _buildSizeBox2(screenHeight),


          ]);
  }
}
Widget _buildSizeBox(double screenHeight) {
    return  SizedBox(height: screenHeight * 0.02);
}
Widget _buildTextFormField() {
    return   CustomTextFormField(
              hintText: StringsManager.ENTERAMOUNT,
              colorborder: ColorManager.hintTextColor,
              width: screenWidth * 0.88,
              height: screenHeight / 15,
            );
}
Widget _buildSizeBox2(double screenHeight) {
    return  SizedBox(height: screenHeight * 0.05);
}

Widget _buildText() {
    return  Text(
              StringsManager.SELECTPAYMENTMETHOD,
              style: StylesManager.headLineStyle,
            );}


Widget _buildTextButton() {
    return   Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  StringsManager.ADDPAYMENTMETHOD,
                  style: TextStyle(color: ColorManager.primaryColor),
                ),
              ),
            );
}

Widget _buildAppButton() {
    return    SizedBox(
              width: double.infinity,
              child: AppButton(
                text: StringsManager.CONFIRM,
                onPressed: wiee,
                backgroundColor: ColorManager.primaryColor,
                width: screenWidth * 0.88,
                height: screenHeight / 15,
                textStyle: StylesManager.greenButtonStyle,
                hasIcon: false,
              ),
            );
}

  void _onAppBarPressed(context) {
    Navigator.of(context).pop();
  }


wiee() {
}
