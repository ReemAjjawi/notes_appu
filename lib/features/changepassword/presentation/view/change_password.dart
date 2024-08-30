import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickalert/quickalert.dart';
import '../../../../core/helper/build_app_bar.dart';
import '../../../../core/helper/indicator.dart';
import '../../../../core/resources/managers/colors_manager.dart';
import '../../../../core/resources/managers/strings_manager.dart';
import '../../../../core/resources/managers/styles_manager.dart';
import '../../../../core/validators.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../core/widgets/success_widget.dart';
import '../../../../injection_file.dart';
import '../../../../main.dart';
import '../../data/model/changepasswordModel.dart';
import '../changepassword_bloc/changepassword_bloc.dart';

class ChangePasswordScreen extends StatefulWidget {
  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final isObscuredOldPassword = ValueNotifier<bool>(true);
  final isObscuredNewPassword = ValueNotifier<bool>(true);
  final isObscuredConfirmPassword = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: BlocProvider(
        create: (context) => changepasswordBloc(sl()),
        child: Form(
            key: _formKey,
            child: _buildBody(screenWidth, screenHeight, isMobile)),
      ),
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
    return Column(children: [
      _buildSizeBox(screenHeight),
      _buildTextFormField(
          oldPasswordController, screenWidth, screenHeight, isMobile),
      _buildSizeBox(screenHeight),
      _buildTextFormField2(
          newPasswordController, screenWidth, screenHeight, isMobile),
      _buildSizeBox(screenHeight),
      _buildTextFormField3(
          confirmPasswordController, screenWidth, screenHeight, isMobile),
      _buildSizeBox(screenHeight),
      _buildAppButton(_formKey, screenWidth, screenHeight, isMobile),
    ]);
  }

  Widget _buildSizeBox(double screenHeight) {
    return SizedBox(height: screenHeight * 0.02);
  }

  Widget _buildTextFormField(oldPasswordController, double screenWidth,
      double screenHeight, bool isMobile) {
    return ValueListenableBuilder<bool>(
      valueListenable: isObscuredOldPassword,
      builder: (context, value, child) {
        return Padding(
          padding: EdgeInsets.all(padding),
          child: CustomTextFormField(
            colorborder: ColorManager.hintTextColor,
            width: screenWidth * 0.92,
            height: screenHeight / 14,
            controller: oldPasswordController,
            obscureText: value,
            validator: (value) {
              return passwordValidator(value);
            },
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
          ),
        );
      },
    );
  }

  Widget _buildTextFormField2(newPasswordController, double screenWidth,
      double screenHeight, bool isMobile) {
    return ValueListenableBuilder<bool>(
      valueListenable: isObscuredNewPassword,
      builder: (context, value, child) {
        return Padding(
          padding: EdgeInsets.all(padding),
          child: CustomTextFormField(
            colorborder: ColorManager.hintTextColor,
            width: screenWidth * 0.92,
            height: screenHeight / 14,
            controller: newPasswordController,
            validator: (value) {
              return passwordValidator(value);
            },
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
          ),
        );
      },
    );
  }

  Widget _buildTextFormField3(confirmPasswordController, double screenWidth,
      double screenHeight, bool isMobile) {
    return ValueListenableBuilder<bool>(
      valueListenable: isObscuredConfirmPassword,
      builder: (context, value, child) {
        return Padding(
          padding: EdgeInsets.all(padding),
          child: CustomTextFormField(
            validator: (value) {
              return confirmPasswordValidator(
                  value, confirmPasswordController.text);
            },
            colorborder: ColorManager.hintTextColor,
            width: screenWidth * 0.92,
            height: screenHeight / 14,
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
          ),
        );
      },
    );
  }

  Widget _buildAppButton(
      _formKey, double screenWidth, double screenHeight, bool isMobile) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: BlocConsumer<changepasswordBloc, changepasswordClassState>(
        listener: (context, state) async {
          if (state is FailureStatechangepassword) {
            await QuickAlert.show(
              context: context,
              type: QuickAlertType.error,
              title: 'Error',
              text: state.message,
            );
            Navigator.pushNamed(context, '/ChangePasswordScreen');
          }

          if (state is unknowStatechangepassword) {
            await QuickAlert.show(
              context: context,
              type: QuickAlertType.error,
              title: 'Error',
              text: state.message,
            );
            Navigator.pushNamed(context, '/ChangePasswordScreen');
          }
          if (state is internetStatechangepassword) {
            await QuickAlert.show(
              context: context,
              type: QuickAlertType.error,
              title: 'Errorinternet',
              text: state.message,
            );
            Navigator.pushNamed(context, '/ChangePasswordScreen');
          }
        },
        builder: (context, state) {
          if (state is InitialStatechangepassword) {
            return AppButton(
              text: StringsManager.SAVE,
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  changepasswordModel changepassword = changepasswordModel(
                      currentPassword: oldPasswordController.text,
                      newPassword: newPasswordController.text,
                      confirmPassword: confirmPasswordController.text);
                  print(changepassword);
                  context.read<changepasswordBloc>().add(
                        changepasswordEvent(changepassword),
                      );
                }
              },
              backgroundColor: ColorManager.primaryColor,
              width: screenWidth * 0.88,
              height: screenHeight / 15,
              textStyle: StylesManager.greenButtonStyle,
              hasIcon: false,
            );
          } else if (state is LoadingStatechangepassword) {
            //  QuickAlert.show(context: context, type: QuickAlertType.loading);
            return const Center(child: Indicator());
          } else {
            return const SuccessWidget();
          }
        },
      ),
    );
  }

  void _onAppBarPressed(context) {
    Navigator.of(context).pop();
  }
}
