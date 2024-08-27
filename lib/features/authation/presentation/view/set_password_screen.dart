import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickalert/quickalert.dart';
import 'package:ride_application/features/authation/data/model/user_model.dart';

import '../../../../core/helper/build_app_bar.dart';
import '../../../../core/helper/indicator.dart';
import '../../../../core/resources/managers/colors_manager.dart';
import '../../../../core/resources/managers/strings_manager.dart';
import '../../../../core/validators.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../injection_file.dart';
import '../../../../main.dart';
import '../auth_bloc/auth_bloc.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key, required this.user});
  UserModel user;
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final ValueNotifier<bool> obscureTextPasswordNotifier = ValueNotifier(true);
  final ValueNotifier<bool> obscureTextConfirmPasswordNotifier =
      ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(sl()),
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: screenHeight * 0.01),
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
                  SizedBox(
                      height: isPortrait
                          ? screenHeight * 0.12
                          : screenHeight * 0.05),
                  Center(
                    child: SizedBox(
                      width: screenWidth * 0.92,
                      height: screenHeight / 12,
                      child: ValueListenableBuilder<bool>(
                        valueListenable: obscureTextPasswordNotifier,
                        builder: (context, obscureTextPassword, child) {
                          return TextFormField(
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
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: ColorManager.hintTextColor,
                                ),
                                onPressed: () {
                                  obscureTextPasswordNotifier.value =
                                      !obscureTextPassword;
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
                              errorMaxLines: 1,
                              errorStyle: const TextStyle(height: 0.4),
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
                              return passwordValidator(value);
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
                      height: screenHeight / 12,
                      child: ValueListenableBuilder<bool>(
                        valueListenable: obscureTextConfirmPasswordNotifier,
                        builder: (context, obscureTextConfirmPassword, child) {
                          return TextFormField(
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
                                      ? Icons.visibility_off
                                      : Icons.visibility,
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
                              errorMaxLines: 1,
                              errorStyle: const TextStyle(height: 0.4),
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
                              return confirmPasswordValidator(
                                  value, passwordController.text);
                            },
                          );
                        },
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
                  SizedBox(
                      height: isPortrait
                          ? screenHeight * 0.20
                          : screenHeight * 0.10),
                  Center(
                    child: BlocConsumer<AuthBloc, RegisterClassState>(
                      listener: (context, state) {
                        if (state is FailureState) {
                          QuickAlert.show(
                            context: context,
                            type: QuickAlertType.error,
                            title: 'Error',
                            text: state.message,
                          );

                          Navigator.pushNamed(context, '/SignUp');
                        } else if (state is RegisterSuccessState) {
                          QuickAlert.show(
                            context: context,
                            type: QuickAlertType.success,
                            title: 'Success',
                            text: 'Register was successful!',
                          );
                          Navigator.pushNamed(context, '/CategoriesScreen');
                        } else if (state is LoadingState) {
                          QuickAlert.show(
                              context: context, type: QuickAlertType.loading);
                        }
                      },
                      builder: (context, state) {
                        if (state is InitialState) {
                          return AppButton(
                            text: StringsManager.REGISTER,
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                print(widget.user.firstName);
                                widget.user.password = passwordController.text;
                                widget.user.confirmPassword =
                                    confirmPasswordController.text;
                                print(widget.user);
                                context.read<AuthBloc>().add(
                                      RegisterEvent(widget.user),
                                    );

                                // Navigator.pushNamed(context, '/LoginScreen');
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
                        } else if (state is LoadingState) {
                          return const SizedBox();
                        } else if (state is FailureState) {
                          return SizedBox(
                            height: screenHeight / 3,
                            child: Column(
                              children: [
                                AppButton(
                                  text: StringsManager.REGISTER,
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      context.read<AuthBloc>().add(
                                            RegisterEvent(widget.user),
                                          );
                                      print(widget.user.firstName);
                                      widget.user.password =
                                          passwordController.text;
                                      widget.user.confirmPassword =
                                          confirmPasswordController.text;
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
                                  state.message!,
                                  style: const TextStyle(
                                      fontSize: 20, color: Colors.red),
                                )
                              ],
                            ),
                          );
                        } else {
                          return const SizedBox();
                        }
                      },
                    ),
                  ),
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