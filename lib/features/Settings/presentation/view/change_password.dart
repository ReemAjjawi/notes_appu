import 'package:flutter/material.dart';
import '../../../../core/helper/build_app_bar.dart';
import '../../../../core/resources/managers/colors_manager.dart';
import '../../../../core/resources/managers/strings_manager.dart';
import '../../../../core/resources/managers/styles_manager.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../main.dart';

class ChangePasswordScreen extends StatefulWidget {
  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final isObscuredOldPassword = ValueNotifier<bool>(true);
  final isObscuredNewPassword = ValueNotifier<bool>(true);
  final isObscuredConfirmPassword = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(screenWidth, screenHeight, isMobile),
    );
  }

  @override
  void dispose() {
    oldPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    isObscuredOldPassword.dispose();
    isObscuredNewPassword.dispose();
    isObscuredConfirmPassword.dispose();
    super.dispose();
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return buildAppBar(
      hasLeading: true,
      title: Text(StringsManager.CHARGEPASSWORD),
      onPressed: () => _onAppBarPressed(context),
    );
  }

  Widget _buildBody(double screenWidth, double screenHeight, bool isMobile) {
    return Column(
        children: [
          _buildSizeBox(screenHeight),
          _buildTextFormField(screenWidth, screenHeight, isMobile),
          _buildSizeBox(screenHeight),
          _buildTextFormField2(screenWidth, screenHeight, isMobile),
          _buildSizeBox(screenHeight),
          _buildTextFormField3(screenWidth, screenHeight, isMobile),
          _buildSizeBox(screenHeight),
          _buildAppButton(screenWidth, screenHeight, isMobile),
        ]);
  }

  Widget _buildSizeBox(double screenHeight) {
    return SizedBox(height: screenHeight * 0.02);
  }

  Widget _buildTextFormField(double screenWidth, double screenHeight, bool isMobile) {
    return ValueListenableBuilder<bool>(
      valueListenable: isObscuredOldPassword,
      builder: (context, value, child) {
        return CustomTextFormField(
          colorborder: ColorManager.hintTextColor,
          width: isMobile ? screenWidth * 0.5 : screenWidth * 0.92,
          height: isMobile ? screenHeight / 12 : screenHeight / 15,
          controller: oldPasswordController,
          obscureText: value,
          hintText: StringsManager.OLDPASSWORD,
          textStyle: TextStyle(
            color: ColorManager.hintTextColor,
            fontSize: isMobile ? screenHeight * 0.025 : screenHeight * 0.02,
          ),
          suffixIconIcon: IconButton(
            icon: Icon(
              value ? Icons.visibility_off : Icons.visibility,
            ),
            onPressed: () {
              isObscuredOldPassword.value = !value;
            },
          ),
        );
      },
    );
  }

  Widget _buildTextFormField2(double screenWidth, double screenHeight, bool isMobile) {
    return ValueListenableBuilder<bool>(
      valueListenable: isObscuredNewPassword,
      builder: (context, value, child) {
        return CustomTextFormField(
          colorborder: ColorManager.hintTextColor,
          width: isMobile ? screenWidth * 0.5 : screenWidth * 0.92,
          height: isMobile ? screenHeight / 12 : screenHeight / 15,
          controller: newPasswordController,
          obscureText: value,
          hintText: StringsManager.NEWPASSWORD,
          textStyle: TextStyle(
            color: ColorManager.hintTextColor,
            fontSize: isMobile ? screenHeight * 0.025 : screenHeight * 0.02,
          ),
          suffixIconIcon: IconButton(
            icon: Icon(
              value ? Icons.visibility_off : Icons.visibility,
            ),
            onPressed: () {
              isObscuredNewPassword.value = !value;
            },
          ),
        );
      },
    );
  }

  Widget _buildTextFormField3(double screenWidth, double screenHeight, bool isMobile) {
    return ValueListenableBuilder<bool>(
      valueListenable: isObscuredConfirmPassword,
      builder: (context, value, child) {
        return CustomTextFormField(
          colorborder: ColorManager.hintTextColor,
          width: isMobile ? screenWidth * 0.5 : screenWidth * 0.92,
          height: isMobile ? screenHeight / 12 : screenHeight / 15,
          controller: confirmPasswordController,
          obscureText: value,
          hintText: StringsManager.CONFIRMPASSWORD,
          textStyle: TextStyle(
            color: ColorManager.hintTextColor,
            fontSize: isMobile ? screenHeight * 0.025 : screenHeight * 0.02,
          ),
          suffixIconIcon: IconButton(
            icon: Icon(
              value ? Icons.visibility_off : Icons.visibility,
            ),
            onPressed: () {
              isObscuredConfirmPassword.value = !value;
            },
          ),
        );
      },
    );
  }

  Widget _buildAppButton(double screenWidth, double screenHeight, bool isMobile) {
    return AppButton(
      text: StringsManager.SAVE,
      onPressed: () {},
      backgroundColor: ColorManager.primaryColor,
      width: isMobile ? screenWidth * 0.5 : screenWidth * 0.88,
      height: isMobile ? screenHeight / 12 : screenHeight / 15,
      textStyle: StylesManager.greenButtonStyle,
      hasIcon: false,
    );
  }

  void _onAppBarPressed(context) {
    Navigator.of(context).pop();
  }
}
