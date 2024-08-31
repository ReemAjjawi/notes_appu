import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickalert/quickalert.dart';

import '../../../../../core/helper/build_app_bar.dart';
import '../../../../../core/resources/managers/colors_manager.dart';
import '../../../../../core/resources/managers/strings_manager.dart';
import '../../../../../core/resources/managers/styles_manager.dart';
import '../../../../../core/validators.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/app_text_field.dart';
import '../../../../../injection_file.dart';
import '../../../../../main.dart';
import '../../data/model/wallet_model.dart';
import '../bloc/wallet_creation_bloc/wallet_creation_bloc.dart';
import '../bloc/wallet_creation_bloc/wallet_creation_event.dart';
import '../bloc/wallet_creation_bloc/wallet_creation_state.dart';

class CreateWalletScreen1 extends StatelessWidget {
  CreateWalletScreen1({super.key});
  final TextEditingController securityController = TextEditingController();
  final TextEditingController confirmSecurityController =
      TextEditingController();
  final TextEditingController bankAccountController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final ValueNotifier<bool> obscureTextsecurityNotifier = ValueNotifier(true);
  final ValueNotifier<bool> obscureTextConfirmsecurityNotifier =
      ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WalletCreationBloc(sl()),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: buildAppBar(
            hasLeading: true,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          body: BlocConsumer<WalletCreationBloc, WalletCreationClassState>(
            listener: (context, state) async {
              if (state is FailureState) {
                QuickAlert.show(
                  context: context,
                  type: QuickAlertType.error,
                  title: 'Error',
                  text: state.message,
                );

                Navigator.pushNamed(context, '/CreateWalletScreen');
              } else if (state is SuccessState) {
                QuickAlert.show(
                  context: context,
                  type: QuickAlertType.success,
                  title: 'Success',
                  text: 'create wallet done successfully!',
                );
              } else if (state is LoadingState) {
                QuickAlert.show(
                  context: context,
                  type: QuickAlertType.loading,
                );
              }
            },
            builder: (context, state) {
              if (state is InitialState) {
                return Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: screenHeight * 0.01),
                        Text(
                          "Create Wallet",
                          style: TextStyle(
                            color: ColorManager.headLineColor,
                            fontSize: screenHeight * 0.03,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.01),
                        Text(
                          "Create your Wallet",
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
                            height: screenHeight / 14,
                            child: ValueListenableBuilder<bool>(
                              valueListenable: obscureTextsecurityNotifier,
                              builder: (context, obscureTextPassword, child) {
                                return TextFormField(
                                  controller: securityController,
                                  obscureText: obscureTextPassword,
                                  decoration: InputDecoration(
                                    hintText: "Enter your wallet",
                                    hintStyle: TextStyle(
                                      color: ColorManager.subLineColor,
                                      fontSize: screenHeight * 0.02,
                                    ),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        obscureTextPassword
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        color: ColorManager.subLineColor,
                                      ),
                                      onPressed: () {
                                        obscureTextsecurityNotifier.value =
                                            !obscureTextPassword;
                                      },
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: ColorManager.subLineColor),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: ColorManager.subLineColor),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: ColorManager.subLineColor),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    errorMaxLines: 1,
                                    errorStyle: const TextStyle(height: 0.4),
                                    contentPadding: EdgeInsets.symmetric(
                                      vertical: screenHeight * 0.02,
                                      horizontal: screenWidth * 0.04,
                                    ),
                                  ),
                                  style: TextStyle(
                                    color: ColorManager.headLineColor,
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
                            height: screenHeight / 14,
                            child: ValueListenableBuilder<bool>(
                              valueListenable:
                                  obscureTextConfirmsecurityNotifier,
                              builder:
                                  (context, obscureTextConfirmPassword, child) {
                                return TextFormField(
                                  controller: confirmSecurityController,
                                  obscureText: obscureTextConfirmPassword,
                                  decoration: InputDecoration(
                                    hintText: "confirm wallet",
                                    hintStyle: TextStyle(
                                      color: ColorManager.subLineColor,
                                      fontSize: screenHeight * 0.02,
                                    ),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        obscureTextConfirmPassword
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        color: ColorManager.subLineColor,
                                      ),
                                      onPressed: () {
                                        obscureTextConfirmsecurityNotifier
                                                .value =
                                            !obscureTextConfirmPassword;
                                      },
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: ColorManager.subLineColor),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: ColorManager.subLineColor),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: ColorManager.subLineColor),
                                    ),
                                    errorMaxLines: 1,
                                    errorStyle: TextStyle(height: 0.4),
                                    contentPadding: EdgeInsets.symmetric(
                                      vertical: screenHeight * 0.02,
                                      horizontal: screenWidth * 0.04,
                                    ),
                                  ),
                                  style: TextStyle(
                                    color: ColorManager.headLineColor,
                                    fontSize: screenHeight * 0.02,
                                  ),
                                  validator: (value) {
                                    return confirmPasswordValidator(
                                        value, securityController.text);
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        CustomTextFormField(
                          controller: bankAccountController,
                          hintText: "Enter your bank account..",
                          textStyleHintText: TextStyle(
                            fontSize: screenHeight * 0.02,
                            color: ColorManager.subLineColor,
                          ),
                          colorborder: ColorManager.subLineColor,
                          width: screenWidth * 0.92,
                          height: screenHeight / 14,
                          validator: (value) {
                            return stringValidator(value);
                          },
                        ),
                        SizedBox(height: screenHeight / 50),
                        SizedBox(
                            height: isPortrait
                                ? screenHeight * 0.20
                                : screenHeight * 0.10),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: AppButton(
                            text: "Create Wallet",
                            onPressed: () {
                              Wallet wallet = Wallet(
                                  securityCode: securityController.text,
                                  confirmSecurityCode:
                                      confirmSecurityController.text,
                                  bankAccount: bankAccountController.text);
                              context.read<WalletCreationBloc>().add(
                                    WalletCreationEvent(wallet: wallet),
                                  );
                            },
                            backgroundColor: ColorManager.primaryColor,
                            width: screenWidth,
                            height: screenHeight / 15,
                            textStyle: StylesManager.greenButtonStyle,
                            hasIcon: false,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return const SizedBox();
              }
            },
          ),
        );
      }),
    );
  }

  @override
  void dispose() {
    obscureTextsecurityNotifier.dispose();
    obscureTextConfirmsecurityNotifier.dispose();
    // super.dispose();
  }
}
