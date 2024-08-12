import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dash/flutter_dash.dart';

import '../../../../core/helper/build_app_bar.dart';
import '../../../../core/resources/managers/assets_manager.dart';
import '../../../../core/resources/managers/colors_manager.dart';
import '../../../../core/resources/managers/strings_manager.dart';
import '../../../../core/resources/managers/styles_manager.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_list_tile.dart';
import '../../../../main.dart';
import '../../../hub_content/data/model/second_model.dart';
import '../../../map/data/model/hubinfo_model.dart';

class ReservationtowScreen extends StatelessWidget {
  final BicycleListModel bicycle;
  final HubinfoModel hubId;
  final HubinfoModel hubIdto;

  ReservationtowScreen({
    Key? key,
    required this.bicycle,
    required this.hubId,
    required this.hubIdto,
  }) : super(key: key);

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(builder: (context) {
        return Scaffold(
          appBar: buildAppBar(
            hasLeading: true,
            title: Text(StringsManager.REQUESTFORRENT),
            onPressed: () => _onAppBarPressed(context),
          ),
          body: Form(
              key: formKey,
              child: buildBody(screenWidth, screenHeight, context)),
        );
      }),
    );
  }

  Widget buildColumn(double screenHeight, double screenWidth) {
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

    return Column(
      children: payment.map((item) {
        return Card(
          child: CustomListTile(
            leading: Image(image: AssetImage(item['Image']!)),
            title: Text(item['name']!, style: StylesManager.titleTextStyle),
            subtitle: Text(item['date']!, style: StylesManager.subTitleStyle),
            backgroundColor: ColorManager.scondaryColor,
            borderColor: ColorManager.borderColor,
            height: screenHeight * 0.1,
            width: screenWidth,
            hasrawtitle: false,
            hasrawsubtitle: false,
            hascolum: false,
          ),
        );
      }).toList(),
    );
  }

  Widget buildBody(double screenWidth, double screenHeight, context) {
    return ListView(
      children: [
        _buildSizeBox2(screenHeight / 14),
        buildstac(screenHeight, screenWidth),
        _bulidlisttitlee(screenWidth, screenHeight),
        _buildText1(),
        _buildmustong(screenWidth, screenHeight),
        _buildvat(screenHeight, screenWidth),
        _buildText(),
        _buildSizeBox(screenHeight),
        buildColumn(screenHeight, screenWidth),
        _buildbottom1(screenWidth, screenHeight, context),
      ],
    );
  }

  Widget _buildbottom1(double screenWidth, double screenHeight, context) {
    return Padding(
      padding: EdgeInsets.all(screenWidth * 0.02),
      child: AppButton(
        text: StringsManager.CONFIRMBOOKING,
        onPressed: () {
          Navigator.pushNamed(
            context,
            '/ThankYouScreen',
          );
        },
        backgroundColor: ColorManager.primaryColor,
        width: screenWidth * 0.88,
        height: screenHeight / 16.5,
        textStyle: TextStyle(
          color: ColorManager.whiteColor,
          fontSize: screenHeight * 0.02,
        ),
        hasIcon: false,
      ),
    );
  }

  Stack buildstac(double screenHeight, double screenWidth) {
    return Stack(
      children: [
        Column(
          children: [
            CustomListTile(
              leading: const Icon(
                Icons.location_on,
                color: ColorManager.cancelColor,
              ),
              title: Text(StringsManager.CURRENTLOCATION,
                  style: StylesManager.titleTextStyle),
              subtitle: Text(hubId.name, style: StylesManager.subTitleStyle),
              backgroundColor: ColorManager.whiteColor,
              borderColor: ColorManager.whiteColor,
              height: screenHeight * 0.1,
              width: screenWidth,
              hasrawtitle: false,
              hasrawsubtitle: false,
              hascolum: false,
            ),
            CustomListTile(
              leading: const Icon(
                Icons.location_on,
                color: Colors.blue,
              ),
              title: Text(StringsManager.OFFICE,
                  style: StylesManager.titleTextStyle),
              subtitle: Text(hubIdto.name, style: StylesManager.subTitleStyle),
              backgroundColor: ColorManager.whiteColor,
              borderColor: ColorManager.whiteColor,
              height: screenHeight * 0.1,
              width: screenWidth,
              hasrawtitle: false,
              hasrawsubtitle: false,
              hascolum: false,
            ),
          ],
        ),
        Positioned(
          left: screenWidth - (screenWidth - 29),
          top: screenHeight * 0.1 / 2,
          child: Dash(
            direction: Axis.vertical,
            length: screenHeight * 0.1,
            dashLength: 4,
            dashColor: Colors.grey,
          ),
        ),
      ],
    );
  }

  Padding _bulidlisttitlee(double screenWidth, double screenHeight) {
    return Padding(
      padding: EdgeInsets.all(screenWidth * 0.03),
      child: CustomListTile(
        title: Text(bicycle.type, style: StylesManager.titleTextStyle),
        subtitle: Icon(Icons.star, color: ColorManager.starColor),
        subtitle2: Text(
          StringsManager.REVIEWS,
          style: StylesManager.subTitleStyle,
        ),
        trailing: Image.asset(
          AssetsManager.bmwRedImage,
          height: screenHeight * 0.25,
          fit: BoxFit.cover,
        ),
        backgroundColor: ColorManager.scondaryColor,
        borderColor: ColorManager.borderColor,
        height: screenHeight * 0.1,
        width: screenWidth,
        hasrawtitle: false,
        hasrawsubtitle: true,
        hascolum: false,
      ),
    );
  }

  CustomListTile _buildmustong(double screenWidth, double screenHeight) {
    return CustomListTile(
      title: Text(StringsManager.MUSTANGPERHOURS,
          style: StylesManager.titleTextStyle),
      backgroundColor: ColorManager.whiteColor,
      trailing: Text("\$200", style: StylesManager.titleTextStyle),
      borderColor: ColorManager.whiteColor,
      height: screenHeight * 0.1,
      width: screenWidth,
      hasrawtitle: false,
      hasrawsubtitle: false,
      hascolum: false,
    );
  }

  CustomListTile _buildvat(double screenHeight, double screenWidth) {
    return CustomListTile(
      title: Text(StringsManager.VAT, style: StylesManager.titleTextStyle),
      backgroundColor: ColorManager.whiteColor,
      trailing: Text("%20", style: StylesManager.titleTextStyle),
      borderColor: ColorManager.whiteColor,
      height: screenHeight * 0.1,
      width: screenWidth,
      hasrawtitle: false,
      hasrawsubtitle: false,
      hascolum: false,
    );
  }
}

Widget _buildSizeBox(double screenHeight) {
  return SizedBox(height: screenHeight * 0.02);
}

Widget _buildSizeBox2(double screenHeight) {
  return SizedBox(height: screenHeight * 0.05);
}

Widget _buildText() {
  return Padding(
    padding: EdgeInsets.all(screenWidth * 0.02),
    child: Text(
      StringsManager.SELECTPAYMENTMETHOD,
      style: StylesManager.headLineStyle,
    ),
  );
}

Widget _buildText1() {
  return Padding(
    padding: EdgeInsets.all(screenWidth * 0.02),
    child: Text(
      StringsManager.CHARGE,
      style: StylesManager.headLineStyle,
    ),
  );
}

Widget _buildAppButton() {
  return SizedBox(
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

wiee() {}
