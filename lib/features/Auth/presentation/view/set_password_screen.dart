import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ride_application/core/helper/build_app_bar.dart';
import 'package:ride_application/core/resources/managers/colors_manager.dart';
import 'package:ride_application/core/resources/managers/strings_manager.dart';
import 'package:ride_application/core/widgets/app_button.dart';
import 'package:ride_application/main.dart';

import '../../../../core/helper/indicator.dart';
import '../../../../core/widgets/success_widget.dart';
import '../../../../injection_file.dart';
import '../../data/model/article_model.dart';
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
  bool obscureTextPassword = true;
  bool obscureTextConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    // final UserModel user =
    //     ModalRoute.of(context)!.settings.arguments as UserModel;

    return BlocProvider(
      create: (context) => AuthBloc(sl()),
      child: Builder(builder: (context) {
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
                        borderSide:
                            BorderSide(color: ColorManager.hintTextColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: ColorManager.hintTextColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: ColorManager.hintTextColor),
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
                        borderSide:
                            BorderSide(color: ColorManager.hintTextColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: ColorManager.hintTextColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: ColorManager.hintTextColor),
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
                child: BlocBuilder<AuthBloc, RegisterClassState>(
                  builder: (context, state) {
                     if (state is InitialState) {
        return      AppButton(
                      text: StringsManager.REGISTER,
                      onPressed: () {
                        
                        print(widget.user.firstName);
                        widget.user.password = passwordController.text;
                        widget.user.confirmPassword =
                            confirmPasswordController.text;
                        Navigator.pushNamed(context, '/WelcomeView');

                        context.read<AuthBloc>().add(
                              RegisterEvent(widget.user),
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
                    );}
               else if (state is LoadingState) {
        return Indicator();
      }

      
                  else if(state is FailureState)  {
                     return SizedBox(
                        height: screenHeight/3,
                        child: Column(
                          children: [
                            AppButton(
                      text: StringsManager.REGISTER,
                      onPressed: () {
                        
                        print(widget.user.firstName);
                        widget.user.password = passwordController.text;
                        widget.user.confirmPassword =
                            confirmPasswordController.text;
                        Navigator.pushNamed(context, '/WelcomeView');

                        context.read<AuthBloc>().add(
                              RegisterEvent(widget.user),
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
                    )    ,
                      Text(
                              state.message,
                              style: TextStyle(fontSize: 20, color: Colors.red),
                            )
                          ],
                        ),
                      );
                  } 
                  else{
                  return  SuccessWidget();
                  }        
                  },
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

// _buildBody() {
//   return
  
// }










//   import 'package:flutter/material.dart';
// import 'package:ride_application/core/resources/managers/colors_manager.dart';
// import 'package:ride_application/core/resources/managers/strings_manager.dart';
// import 'package:ride_application/core/resources/managers/styles_manager.dart';
// import 'package:ride_application/core/widgets/app_button.dart';
// import 'package:ride_application/core/widgets/app_text_field.dart';
// import 'package:ride_application/main.dart';

// class SetPasswordView extends StatefulWidget {
//   const SetPasswordView({super.key});

//   @override
//   State<SetPasswordView> createState() => _SetPasswordViewState();
// }

// class _SetPasswordViewState extends State<SetPasswordView> {
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController confirmPasswordController = TextEditingController();
//   bool obscureTextPassword = true;
//   bool obscureTextConfirmPassword = true;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             StringsManager.SETPASSWORD,
//             style: StylesManager.headLineStyle,
//           ),
//           SizedBox(height: screenHeight * 0.01),
//           Text(
//             StringsManager.SETYOURPASSWORD,
//             style: StylesManager.subLineStyle,
//           ),
//           SizedBox(height: screenHeight * 0.12),
//           Center(
//             child: SizedBox(
//               width: screenWidth * 0.92,
//               height: screenHeight / 15,
//               child: CustomTextFormField(
//                 controller: passwordController,
//                 obscureText: obscureTextPassword,
//                 hintText: StringsManager.ENTERYOURPASSWORD,
//                 textStyleHintText: StylesManager.hintTextStyle,
//                 suffixIconIcon: IconButton(
//                   icon: Icon(
//                     obscureTextPassword ? Icons.visibility : Icons.visibility_off,
//                     color: ColorManager.hintTextColor,
//                   ),
//                   onPressed: () {
//                     setState(() {
//                       obscureTextPassword = !obscureTextPassword;
//                     });
//                   },
//                 ),
//                 colorborder: ColorManager.hintTextColor,
//                 width: screenWidth * 0.92,
//                 height: screenHeight / 15,
//                 textStyle: TextStyle(
//                   color: ColorManager.hintTextColor,
//                   fontSize: screenHeight * 0.02,
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(height: screenHeight * 0.02),
//           Center(
//             child: SizedBox(
//               width: screenWidth * 0.92,
//               height: screenHeight / 15,
//               child: CustomTextFormField(
//                 controller: confirmPasswordController,
//                 obscureText: obscureTextConfirmPassword,
//                 hintText: StringsManager.CONFIRMPASSWORD,
//                 textStyleHintText: StylesManager.hintTextStyle,
//                 suffixIconIcon: IconButton(
//                   icon: Icon(
//                     obscureTextConfirmPassword ? Icons.visibility : Icons.visibility_off,
//                     color: ColorManager.hintTextColor,
//                   ),
//                   onPressed: () {
//                     setState(() {
//                       obscureTextConfirmPassword = !obscureTextConfirmPassword;
//                     });
//                   },
//                 ),
//                 colorborder: ColorManager.hintTextColor,
//                 width: screenWidth * 0.92,
//                 height: screenHeight / 15,
//                 textStyle: TextStyle(
//                   color: ColorManager.hintTextColor,
//                   fontSize: screenHeight * 0.02,
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(height: screenHeight * 0.01),
//           SizedBox(
//             width: screenWidth * 0.92,
//             child: Text(
//               StringsManager.ATLEASTNUMBERORASPECIALCHARACTER,
//               style: StylesManager.underHintTextStyle,
//             ),
//           ),
//           SizedBox(height: screenHeight * 0.20),
//           Center(
//             child: AppButton(
//               text: StringsManager.REGISTER,
//               onPressed: gt,
//               backgroundColor: ColorManager.primaryColor,
//               width: screenWidth * 0.88,
//               height: screenHeight / 16.5,
//               textStyle: StylesManager.greenButtonStyle,
//               hasicon: false,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   void gt() {
//     // Implement the function to handle button press
//   }
// }
