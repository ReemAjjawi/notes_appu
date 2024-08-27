import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../../core/helper/build_app_bar.dart';
import '../../../../core/resources/managers/assets_manager.dart';
import '../../../../core/resources/managers/colors_manager.dart';
import '../../../../core/resources/managers/strings_manager.dart';
import '../../../../core/validators.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../main.dart';
import '../../data/model/user_model.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  final TextEditingController numberController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        hasLeading: true,
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      body: ListView(
        children: [
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(padding),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      StringsManager.SIGNUPWITH,
                      style: TextStyle(
                        fontWeight: FontWeight.w100,
                        fontSize: screenWidth * 0.06,
                        color: ColorManager.headLineColor,
                      ),
                    ),
                  ),
                ),
                CustomTextFormField(
                  controller: firstnameController,
                  hintText: StringsManager.FIRSTNAME,
                  colorborder: ColorManager.subLineColor,
                  width: screenWidth * 0.92,
                  height: screenHeight / 14,
                  validator: (value) {
                    return stringValidator(value);
                  },
                ),
                SizedBox(height: screenHeight / 50),
                CustomTextFormField(
                  controller: lastnameController,
                  hintText: StringsManager.LASTNAME,
                  colorborder: ColorManager.subLineColor,
                  width: screenWidth * 0.92,
                  height: screenHeight / 14,
                  validator: (value) {
                    return stringValidator(value);
                  },
                ),
                SizedBox(height: screenHeight / 50),
                CustomTextFormField(
                  controller: usernameController,
                  hintText: StringsManager.USERNAME,
                  colorborder: ColorManager.subLineColor,
                  width: screenWidth * 0.92,
                  height: screenHeight / 14,
                  validator: (value) {
                    return stringValidator(value);
                  },
                ),
                SizedBox(height: screenHeight / 50),
                SizedBox(
                  width: screenWidth * 0.92,
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
                        borderSide: const BorderSide(),
                      ),
                    ),
                    initialCountryCode: 'IN',
                    validator: (phone) {
                      return phoneValidator(phone);
                    },
                  ),
                ),
                SizedBox(
                  width: screenWidth * 0.92,
                  height: screenHeight / 13,
                  child: TextFormField(
                      controller: dateController,
                      decoration: InputDecoration(
                        hintText: 'Enter your birth date',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: screenHeight * 0.02,
                            horizontal: screenWidth * 0.04),
                        errorMaxLines: 1,
                        errorStyle: const TextStyle(height: 0.5),
                        suffixIcon: const Icon(Icons.calendar_today),
                      ),
                      onTap: () async {
                        FocusScope.of(context).requestFocus(FocusNode());
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2100),
                        );
                        if (pickedDate != null) {
                          dateController.text =
                              "${pickedDate.toLocal()}".split(' ')[0];
                          print(dateController.text);
                        }
                      },
                      validator: (value) {
                        return dateValidator(value);
                      }),
                ),
                Padding(
                  padding: EdgeInsets.all(padding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(padding),
                        child: const Icon(
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
                                " ${StringsManager.TERMSOFSERVICE} ",
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
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        UserModel user = UserModel(
                          firstName: firstnameController.text,
                          lastName: lastnameController.text,
                          phone: numberController.text,
                          username: firstnameController.text,
                          birthDate: dateController.text,
                          password: " ",
                          confirmPassword: " ",
                        );
                        print(user);
                        Navigator.pushNamed(context, '/RegisterScreen',
                            arguments: user);
                      }
                    },
                    backgroundColor: ColorManager.primaryColor,
                    width: screenWidth * 0.88,
                    height: screenHeight / 13,
                    hasIcon: false),
                const Row(
                  children: [],
                ),
                Text(
                  "______________________ or ______________________",
                  style: TextStyle(
                    // fontWeight: FontWeight.w400,
                    fontSize: screenWidth * 0.04,
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
                  onPressed: () {},
                  backgroundColor: ColorManager.whiteColor,
                  bordergroundColor: ColorManager.subLineColor,
                  width: screenWidth * 0.92,
                  height: screenHeight / 14,
                  hasIcon: true,
                  img: AssetsManager.gmailImage,
                ),
                SizedBox(height: screenHeight / 50),
                AppButton(
                  textStyle: TextStyle(
                    fontSize: screenWidth * 0.03,
                    color: ColorManager.titleColor,
                  ),
                  text: StringsManager.SIGNUPWITHFACEBOOK,
                  onPressed: () {},
                  backgroundColor: ColorManager.whiteColor,
                  bordergroundColor: ColorManager.subLineColor,
                  width: screenWidth * 0.92,
                  height: screenHeight / 14,
                  hasIcon: true,
                  img: AssetsManager.facebookImage,
                ),
                SizedBox(height: screenHeight / 50),
                AppButton(
                  textStyle: TextStyle(
                    fontSize: screenWidth * 0.03,
                    color: ColorManager.titleColor,
                  ),
                  text: StringsManager.SIGNUPWITHAPPLE,
                  onPressed: () {},
                  backgroundColor: ColorManager.whiteColor,
                  bordergroundColor: ColorManager.subLineColor,
                  width: screenWidth * 0.92,
                  height: screenHeight / 14,
                  hasIcon: true,
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
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/LoginScreen');
                      },
                      child: Text(
                        StringsManager.SIGNIN,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: screenWidth * 0.035,
                          color: ColorManager.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight / 17),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
