import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ride_application/core/helper/build_app_bar.dart';
import 'package:ride_application/core/resources/managers/colors_manager.dart';
import 'package:ride_application/core/resources/managers/strings_manager.dart';
import 'package:ride_application/core/widgets/app_button.dart';
import 'package:ride_application/main.dart';

class SetPasswordView extends StatefulWidget {
  const SetPasswordView({super.key});

  @override
  State<SetPasswordView> createState() => _SetPasswordViewState();
}

class _SetPasswordViewState extends State<SetPasswordView> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool obscureTextPassword = true;
  bool obscureTextConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            StringsManager.SETPASSWORD,
            style: TextStyle(
              color: ColorManager.headLineColor,
              fontSize: screenHeight * 0.03,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: screenHeight * 0.01),
          Text(
            StringsManager.SETYOURPASSWORD,
            style: TextStyle(
              color: ColorManager.subLineColor,
              fontSize: screenHeight * 0.02,
            ),
          ),
          SizedBox(height: screenHeight * 0.12),
          Center(
            child: SizedBox(
              width: screenWidth * 0.92,
              height: screenHeight / 15,
              child: TextFormField(
                controller: passwordController,
                obscureText: obscureTextPassword,
                decoration: InputDecoration(
                  hintText: StringsManager.ENTERYOURPASSWORD,
                  hintStyle: TextStyle(
                    color: ColorManager.hintTextColor,
                    fontSize: screenHeight * 0.02,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      obscureTextPassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: ColorManager.hintTextColor,
                    ),
                    onPressed: () {
                      setState(() {
                        obscureTextPassword = !obscureTextPassword;
                      });
                    },
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorManager.hintTextColor),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorManager.hintTextColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorManager.hintTextColor),
                  ),
                ),
                style: TextStyle(
                  color: ColorManager.hintTextColor,
                  fontSize: screenHeight * 0.02,
                ),
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.02),
          Center(
            child: SizedBox(
              width: screenWidth * 0.92,
              height: screenHeight / 15,
              child: TextFormField(
                controller: confirmPasswordController,
                obscureText: obscureTextConfirmPassword,
                decoration: InputDecoration(
                  hintText: StringsManager.CONFIRMPASSWORD,
                  hintStyle: TextStyle(
                    color: ColorManager.hintTextColor,
                    fontSize: screenHeight * 0.02,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      obscureTextConfirmPassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: ColorManager.hintTextColor,
                    ),
                    onPressed: () {
                      setState(() {
                        obscureTextConfirmPassword =
                            !obscureTextConfirmPassword;
                      });
                    },
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorManager.hintTextColor),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorManager.hintTextColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorManager.hintTextColor),
                  ),
                ),
                style: TextStyle(
                  color: ColorManager.hintTextColor,
                  fontSize: screenHeight * 0.02,
                ),
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.01),
          SizedBox(
            width: screenWidth * 0.92,
            child: Text(
              StringsManager.ATLEASTNUMBERORASPECIALCHARACTER,
              style: TextStyle(
                color: ColorManager.hintTextColor,
                fontSize: screenHeight * 0.02,
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.20),
          Center(
            child: AppButton(
              text: StringsManager.REGISTER,
              onPressed: () {
                context.go('/WelcomeView/Sin_up/SetPasswordView/Register');
              },
              backgroundColor: ColorManager.primaryColor,
              width: screenWidth * 0.88,
              height: screenHeight / 16.5,
              textStyle: TextStyle(
                color: ColorManager.whiteColor,
                fontSize: screenHeight * 0.02,
              ),
              hasicon: false,
            ),
          ),
        ],
      ),
    );
  }

  void gt() {}
}
