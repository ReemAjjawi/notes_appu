import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../../core/helper/build_app_bar.dart';
import '../../../../core/resources/managers/colors_manager.dart';
import '../../../../core/resources/managers/strings_manager.dart';
import '../../../../core/resources/managers/styles_manager.dart';
import '../../../../core/validators.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../main.dart';

class ContactUsScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return buildAppBar(
      hasLeading: true,
      title: Text(StringsManager.CONTACTUS),
      onPressed: () => _onAppBarPressed(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildSizeBox( screenHeight),
              _buildTextes(),
              _buildSizeBox( screenHeight),
              _buildTextFormField(
                controller: nameController,
                hintText: StringsManager.NAME,
              ),
              _buildSizeBox( screenHeight),
              _buildTextFormField(
                controller: emailController,
                hintText: StringsManager.EMAIL,
              ),
              _buildSizeBox( screenHeight),
              _buildPhoneField(),
              _buildSizeBox(screenHeight),
              _buildTextField(),
              _buildSizeBox( screenHeight),
              _buildAppButton(),
              _buildSizeBox( screenHeight),
            ],
          ),
        ),
      ),
    );
  }

  void _onAppBarPressed(BuildContext context) {
    Navigator.of(context).pop();
  }

  Widget _buildTextes() {
    return Column(
      children: [
        _buildText1(),
        _buildSizeBox2(screenHeight),
        _buildText2(),
        _buildSizeBox2(screenHeight),
        _buildText3(),
        _buildSizeBox(screenHeight),
        _buildText4(),
      ],
    );
  }


  Widget _buildText1() {
  return Text(
          StringsManager.CONTACTUSFORRIDESHARE,
          style: StylesManager.headLineStyle,
        );
}
Widget _buildText2() {
  return Text(
          StringsManager.ADDRESS,
          style: StylesManager.titleTextStyle,
        );
}
Widget _buildText3() {
  return Text(
          StringsManager.ADDRESSINFORMATION,
          style: StylesManager.subLineStyle,
          textAlign: TextAlign.center,
        );
}
Widget _buildText4() {
  return  Text(
          StringsManager.SENDMESSAGE,
          style: StylesManager.titleTextStyle,
        );
}

  Widget _buildTextFormField({
    required TextEditingController controller,
    required String hintText,
  }) {
    return CustomTextFormField(
      controller: controller,
      hintText: hintText,
      colorborder: ColorManager.subLineColor,
      width: isPortrait ? screenWidth * 0.88 : screenWidth * 0.6,
      height: isPortrait ? screenHeight / 15 : screenHeight / 10,
      validator: (value) {
        return stringValidator(value);
      },
    );
  }

  Widget _buildPhoneField() {
    return SizedBox(
      width: isPortrait ? screenWidth * 0.88 : screenWidth * 0.6,
      height: screenHeight / 10,
      child: IntlPhoneField(
        controller: numberController,
        decoration: InputDecoration(
          hintText: StringsManager.YOURMOBILENUMBER,
          hintStyle: const TextStyle(
            color: ColorManager.subLineColor,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(),
          ),
        ),
        initialCountryCode: 'IN',
        validator: (phone) {
          return phoneValidator(phone);
        },
      ),
    );
  }

  Widget _buildTextField() {
    return SizedBox(
      width: isPortrait ? screenWidth * 0.88 : screenWidth * 0.6,
      child: TextField(
        maxLines: 4,
        decoration: InputDecoration(
          hintText: StringsManager.WHRITEYOURTEXT,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(),
          ),
        ),
      ),
    );
  }

  Widget _buildAppButton() {
    return Center(
      child: AppButton(
        text: StringsManager.SENDMESSAGE,
        onPressed: () {},
        backgroundColor: ColorManager.primaryColor,
        width: isPortrait ? screenWidth * 0.88 : screenWidth * 0.6,
        height: isPortrait ? screenHeight / 15 : screenHeight / 10,
        textStyle: StylesManager.greenButtonStyle,
        hasIcon: false,
      ),
    );
  }
  
Widget _buildSizeBox(double screenHeight) {
  return SizedBox(height: screenHeight * 0.02);
}
Widget _buildSizeBox2(double screenHeight) {
  return SizedBox(height: screenHeight * 0.01);
}
}
