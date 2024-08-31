import 'package:flutter/material.dart';

import '../../../core/helper/build_app_bar.dart';
import '../../../core/resources/managers/assets_manager.dart';
import '../../../core/resources/managers/colors_manager.dart';
import '../../../core/resources/managers/strings_manager.dart';
import '../../../core/resources/managers/styles_manager.dart';
import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/app_list_tile.dart';
import '../../../core/widgets/app_text_field.dart';
import '../../../core/widgets/secondary_text_field.dart';
import '../../../main.dart';

class PaymentScreen extends StatelessWidget {
  final TextEditingController accountNumberController = TextEditingController();

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
      title: const Text(StringsManager.AMOUNT),
      onPressed: () => _onAppBarPressed(context),
    );
  }

  Widget _buildBody(double screenWidth, double screenHeight) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildSizeBox(screenHeight),
          _buildTextField(),
          _buildSizeBox(screenHeight),
          _buildTextFormField(),
          _buildSizeBox(screenHeight),
          _buildAppButton(),
          _buildSizeBox(screenHeight),
          _buildListView(screenHeight, screenWidth),
        ]);
  }
}

Widget _buildSizeBox(double screenHeight) {
  return SizedBox(height: screenHeight * 0.04);
}

Widget _buildTextField() {
  return GendertextField(
    width: screenWidth * 0.88,
    height: screenHeight / 15,
    options: const [
      StringsManager.WELTON,
      StringsManager.CASH,
      StringsManager.PAYMENT
    ],
    hintText: StringsManager.SELECTPAYMENTMETHOD,
  );
}

Widget _buildTextFormField() {
  return CustomTextFormField(
    hintText: StringsManager.ACCOUNTNUMBER,
    colorborder: ColorManager.hintTextColor,
    width: screenWidth * 0.88,
    height: screenHeight / 15,
  );
}

Widget _buildAppButton() {
  return AppButton(
    text: StringsManager.SAVEPAYMENTMETHOD,
    onPressed: wiee,
    backgroundColor: ColorManager.primaryColor,
    width: screenWidth * 0.88,
    height: screenHeight / 15,
    textStyle: StylesManager.greenButtonStyle,
    hasIcon: false,
  );
}

Widget _buildListView(double screenHeight, double screenWidth) {
  final List<Map<String, String>> payment = [
    {
      'Image': AssetsManager.visaImage,
      'name': StringsManager.VISANUMBER,
      'date': StringsManager.SUBVISANUMBER
    },
    {
      'Image': AssetsManager.mastercardImage,
      'name': StringsManager.VISANUMBER,
      'date': StringsManager.SUBVISANUMBER
    },
    {
      'Image': AssetsManager.mailaddressImage,
      'name': StringsManager.MAILADDRESS,
      'date': StringsManager.SUBVISANUMBER
    },
    {
      'Image': AssetsManager.cashImage,
      'name': StringsManager.CASH,
      'date': StringsManager.SUBVISANUMBER
    },
  ];

  return Expanded(
    child: ListView.builder(
      itemCount: payment.length,
      itemBuilder: (context, index) {
        return Card(
          child: CustomListTile(
            leading: Image(image: AssetImage(payment[index]['Image']!)),
            title: Text(payment[index]['name']!,
                style: StylesManager.titleTextStyle),
            subtitle: Text(payment[index]['date']!,
                style: StylesManager.subTitleStyle),
            backgroundColor: ColorManager.scondaryColor,
            borderColor: ColorManager.borderColor,
            height: screenHeight / 7,
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

void _onAppBarPressed(context) {
  Navigator.of(context).pop();
}

wiee() {}
