import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ride_application/core/resources/managers/colors_manager.dart';
import 'package:ride_application/core/resources/managers/strings_manager.dart';
import 'package:ride_application/core/widgets/app_button.dart';
import 'package:ride_application/features/auth/data/model/user_model.dart';
import 'package:ride_application/main.dart';
import '../../../../core/helper/indicator.dart';
import '../../../../core/widgets/success_widget.dart';
import '../../../../injection_file.dart';
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
                     if (state is InitialState)  {
        return      AppButton(
                      text: StringsManager.REGISTER,
                      onPressed: () async{
                        
                        print(widget.user.firstName);
                        widget.user.password = passwordController.text;
                        widget.user.confirmPassword =
                            confirmPasswordController.text;
                            print(widget.user);
                             context.read<AuthBloc>().add(
                              RegisterEvent(widget.user),
                            );
                        Navigator.pushNamed(context, '/CategoriesScreen');

                     
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
                        Navigator.pushNamed(context, '/CategoriesScreen');

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







