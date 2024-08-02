import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:ride_application/core/helper/build_app_bar.dart';
import 'package:ride_application/core/resources/managers/assets_manager.dart';
import 'package:ride_application/core/resources/managers/colors_manager.dart';
import 'package:ride_application/core/resources/managers/strings_manager.dart';
import 'package:ride_application/core/widgets/app_button.dart';
import 'package:ride_application/core/widgets/app_text_field.dart';
import 'package:ride_application/features/on_boarding_screen/on_borarding_view.dart';
import 'package:ride_application/main.dart';

import '../../../../core/widgets/secondary_text_field.dart';

class Sin_up extends StatelessWidget {
  Sin_up({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        hasleading: true,
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(screenWidth * 0.03),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    StringsManager.SIGNUPWITH,
                    style: TextStyle(
                      fontWeight: FontWeight.w100,
                      fontSize: screenWidth * 0.07,
                      color: ColorManager.headLineColor,
                    ),
                  ),
                ),
              ),
              CustomTextFormField(
                  hintText: StringsManager.NAME,
                  colorborder: ColorManager.subLineColor,
                  width: screenWidth * 0.92,
                  height: screenHeight / 14),
              SizedBox(height: screenHeight / 50),
              CustomTextFormField(
                  hintText: StringsManager.EMAIL,
                  colorborder: ColorManager.subLineColor,
                  width: screenWidth * 0.92,
                  height: screenHeight / 14),
              SizedBox(height: screenHeight / 50),
              SizedBox(
                width: screenWidth * 0.92,
                height: screenHeight / 10,
                child: IntlPhoneField(
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
                  onChanged: (phone) {
                    print(phone.completeNumber);
                  },
                ),
              ),
              GendertextField(
                width: screenWidth * 0.92,
                height: screenHeight / 13,
                options: ['Male', 'Female'],
                hintText: StringsManager.GENDER,
              ),
              Padding(
                padding: EdgeInsets.all(screenWidth * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.check_circle_outline_outlined,
                        color: ColorManager.primaryColor,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              StringsManager.BYSIGNINGUPYOUAGREETOTHE,
                              style: TextStyle(
                                // fontWeight: FontWeight.w400,
                                fontSize: screenWidth * 0.03,
                                color: ColorManager.subTitleColor,
                              ),
                            ),
                            Text(
                              " " + StringsManager.TERMSOFSERVICE + " ",
                              style: TextStyle(
                                // fontWeight: FontWeight.w400,
                                fontSize: screenWidth * 0.03,
                                color: ColorManager.primaryColor,
                              ),
                            ),
                            Text(
                              StringsManager.AND,
                              style: TextStyle(
                                // fontWeight: FontWeight.w400,
                                fontSize: screenWidth * 0.03,
                                color: ColorManager.subTitleColor,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          StringsManager.PRIVACYPOLICY,
                          style: TextStyle(
                            // fontWeight: FontWeight.w400,
                            fontSize: screenWidth * 0.03,
                            color: ColorManager.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              AppButton(
                  textStyle: TextStyle(
                    fontSize: screenWidth * 0.04,
                    color: ColorManager.whiteColor,
                  ),
                  text: StringsManager.SIGNUP,
                  onPressed: gt,
                  backgroundColor: ColorManager.primaryColor,
                  width: screenWidth * 0.88,
                  height: screenHeight / 13,
                  hasicon: false),
              Text(
                "______________________ or ______________________",
                style: TextStyle(
                  // fontWeight: FontWeight.w400,
                  fontSize: screenWidth * 0.04,
                  height: 23 / 16,
                  color: ColorManager.subTitleColor,
                ),
              ),
              SizedBox(height: screenHeight / 50),
              AppButton(
                textStyle: TextStyle(
                  fontSize: screenWidth * 0.03,
                  color: ColorManager.titleColor,
                ),
                text: StringsManager.SIGNUPWITHGMAIL,
                onPressed: gt,
                backgroundColor: ColorManager.whiteColor,
                bordergroundColor: ColorManager.subLineColor,
                width: screenWidth * 0.92,
                height: screenHeight / 14,
                hasicon: true,
                img: AssetsManager.gmailImage,
              ),
              SizedBox(height: screenHeight / 50),
              AppButton(
                textStyle: TextStyle(
                  fontSize: screenWidth * 0.03,
                  color: ColorManager.titleColor,
                ),
                text: StringsManager.SIGNUPWITHFACEBOOK,
                onPressed: gt,
                backgroundColor: ColorManager.whiteColor,
                bordergroundColor: ColorManager.subLineColor,
                width: screenWidth * 0.92,
                height: screenHeight / 14,
                hasicon: true,
                img: AssetsManager.facebookImage,
              ),
              SizedBox(height: screenHeight / 50),
              AppButton(
                textStyle: TextStyle(
                  fontSize: screenWidth * 0.03,
                  color: ColorManager.titleColor,
                ),
                text: StringsManager.SIGNUPWITHAPPLE,
                onPressed: gt,
                backgroundColor: ColorManager.whiteColor,
                bordergroundColor: ColorManager.subLineColor,
                width: screenWidth * 0.92,
                height: screenHeight / 14,
                hasicon: true,
                img: AssetsManager.appleImage,
              ),
              SizedBox(height: screenHeight / 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    StringsManager.ALREADYHAVEANACCOUNT,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: screenWidth * 0.035,
                      color: ColorManager.titleColor,
                    ),
                  ),
                  Text(
                    StringsManager.SIGNIN,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: screenWidth * 0.035,
                      color: ColorManager.primaryColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight / 17),
            ],
          ),
        ],
      ),
    );
  }
}
