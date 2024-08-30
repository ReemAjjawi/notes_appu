import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helper/build_app_bar.dart';
import '../../../../core/helper/indicator.dart';
import '../../../../core/resources/managers/assets_manager.dart';
import '../../../../core/resources/managers/colors_manager.dart';
import '../../../../core/resources/managers/strings_manager.dart';
import '../../../../core/resources/managers/styles_manager.dart';
import '../../../../core/validators.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/success_widget.dart';
import '../../../../injection_file.dart';
import '../../../../main.dart';
import '../../data/model/login_model.dart';
import '../login_bloc/login_bloc.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// import 'package:google_sign_in/google_sign_in.dart';

// Future<UserCredential> signInWithGoogle() async {
//   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

//   final GoogleSignInAuthentication? googleAuth =
//       await googleUser?.authentication;

//   final credential = GoogleAuthProvider.credential(
//     accessToken: googleAuth?.accessToken,
//     idToken: googleAuth?.idToken,
//   );

//   return await FirebaseAuth.instance.signInWithCredential(credential);
// }

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<LoginScreen> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController PasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final ValueNotifier<bool> obscureTextPasswordNotifier = ValueNotifier(true);
  final ValueNotifier<bool> obscureTextConfirmPasswordNotifier =
      ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogInBloc(sl()),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: buildAppBar(
            hasLeading: true,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(padding),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(StringsManager.SIGNUPWITH,
                          style: StylesManager.headLineStyle),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Center(
                    child: SizedBox(
                      width: screenWidth * 0.92,
                      height: screenHeight / 15,
                      child: ValueListenableBuilder<bool>(
                        valueListenable: obscureTextPasswordNotifier,
                        builder: (context, obscureTextPassword, child) {
                          return TextFormField(
                            controller: phoneController,
                            obscureText: obscureTextPassword,
                            decoration: InputDecoration(
                              hintText: StringsManager.YOURMOBILENUMBER,
                              hintStyle: TextStyle(
                                color: ColorManager.hintTextColor,
                                fontSize: screenHeight * 0.02,
                              ),
                              border: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: ColorManager.hintTextColor),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: ColorManager.hintTextColor),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: ColorManager.hintTextColor),
                              ),
                              errorMaxLines: 2,
                              errorStyle: TextStyle(
                                fontSize: screenHeight * 0.018,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                vertical: screenHeight * 0.02,
                                horizontal: screenWidth * 0.04,
                              ),
                            ),
                            style: TextStyle(
                              color: ColorManager.hintTextColor,
                              fontSize: screenHeight * 0.02,
                            ),
                            validator: (value) {
                              return phoneValidator(value);
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Center(
                    child: SizedBox(
                      width: screenWidth * 0.92,
                      height: screenHeight / 15,
                      child: ValueListenableBuilder<bool>(
                        valueListenable: obscureTextConfirmPasswordNotifier,
                        builder: (context, obscureTextConfirmPassword, child) {
                          return TextFormField(
                            controller: PasswordController,
                            obscureText: obscureTextConfirmPassword,
                            decoration: InputDecoration(
                              hintText: StringsManager.ENTERYOURPASSWORD,
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
                                  obscureTextConfirmPasswordNotifier.value =
                                      !obscureTextConfirmPassword;
                                },
                              ),
                              border: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: ColorManager.hintTextColor),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: ColorManager.hintTextColor),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: ColorManager.hintTextColor),
                              ),
                              errorStyle: TextStyle(
                                fontSize: screenHeight * 0.018,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                vertical: screenHeight * 0.02,
                                horizontal: screenWidth * 0.02,
                              ),
                            ),
                            style: TextStyle(
                              color: ColorManager.hintTextColor,
                              fontSize: screenHeight * 0.02,
                            ),
                            validator: (value) {
                              return passwordValidator(value);
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Padding(
                    padding: EdgeInsets.all(padding),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        StringsManager.FORGET,
                        style: TextStyle(
                          color: ColorManager.deleteColor,
                          fontSize: screenHeight * 0.02,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: BlocBuilder<LogInBloc, LogInClassState>(
                      builder: (context, state) {
                        if (state is InitialStateLogIn) {
                          return AppButton(
                            text: StringsManager.SIGNUP,
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                LogInModel user = LogInModel(
                                    phone: phoneController.text,
                                    password: PasswordController.text);

                                print(user);
                                context.read<LogInBloc>().add(
                                      LogInEvent(user),
                                    );
                                Navigator.pushNamed(
                                    context, '/CategoriesScreen');
                              }
                            },
                            backgroundColor: ColorManager.primaryColor,
                            width: screenWidth * 0.88,
                            height: screenHeight / 16.5,
                            textStyle: TextStyle(
                              color: ColorManager.whiteColor,
                              fontSize: screenHeight * 0.02,
                            ),
                            hasIcon: false,
                          );
                        } else if (state is LogInLoadingState) {
                          return Indicator();
                        } else if (state is LogInFailureState) {
                          return SizedBox(
                            height: screenHeight / 3,
                            child: Column(
                              children: [
                                AppButton(
                                  text: StringsManager.SIGNUP,
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      LogInModel user = LogInModel(
                                          phone: phoneController.text,
                                          password: PasswordController.text);

                                      print(user);
                                      context.read<LogInBloc>().add(
                                            LogInEvent(user),
                                          );
                                    }
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
                                Text(
                                  state.message,
                                  style: const TextStyle(
                                      fontSize: 20, color: Colors.red),
                                )
                              ],
                            ),
                          );
                        } else {
                          return SuccessWidget();
                        }
                      },
                    ),
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
                    onPressed: () {
                      // signInWithGoogle();
                    },
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
                        StringsManager.DONTHAVEANACCOUNT,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: screenWidth * 0.035,
                          color: ColorManager.titleColor,
                        ),
                      ),
                      Text(
                        StringsManager.SIGNUP,
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
            ),
          ),
        );
      }),
    );
  }

  @override
  void dispose() {
    obscureTextPasswordNotifier.dispose();
    obscureTextConfirmPasswordNotifier.dispose();
    super.dispose();
  }
}


// _buildBody() {
//   return
  
// }







