import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickalert/quickalert.dart';
import 'package:ride_application/features/wallet/data/model/wallet_model.dart';
import 'package:ride_application/features/wallet/presentation/bloc/wallet_creation_bloc/wallet_creation_bloc.dart';
import 'package:ride_application/features/wallet/presentation/bloc/wallet_creation_bloc/wallet_creation_event.dart';

import '../../../../core/helper/build_app_bar.dart';
import '../../../../core/resources/managers/colors_manager.dart';
import '../../../../core/resources/managers/styles_manager.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../injection_file.dart';
import '../../../../main.dart';
import '../bloc/wallet_creation_bloc/wallet_creation_state.dart';

class CreateWalletScreen extends StatelessWidget {
  CreateWalletScreen({super.key});
  TextEditingController pass = TextEditingController();
  TextEditingController conf = TextEditingController();

  TextEditingController str = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WalletCreationBloc(sl()),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: buildAppBar(
            leadingg: Container(
              width: screenWidth * 0.1,
              height: screenWidth * 0.1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: ColorManager.scondaryColor,
              ),
              child: const Icon(
                Icons.menu,
              ),
            ),
            // actions: [
            //   Icon(Icons.notifications_outlined),
            // ],
          ),
          body: BlocConsumer<WalletCreationBloc, WalletCreationClassState>(
            listener: (context, state) async{
               if (state is FailureState) {
                           QuickAlert.show(
                           context: context,
                            type: QuickAlertType.error,
                            title: 'Error',
                            text: state.message,
                          );

                         Navigator.pushNamed(context, '/WalletScreen');
                        } else if (state is SuccessState) {
                           QuickAlert.show(
                            context: context,
                            type: QuickAlertType.success,
                            title: 'Success',
                            text: 'create wallet done successfully!',
                          
                          );
                          Navigator.pushNamed(context, '/AddAmountScreen');
                        } else if (state is LoadingState) {
                          QuickAlert.show(
                            context: context,
                            type: QuickAlertType.loading,
                          );
                        } 
                      
            },
            builder: (context, state) {
              if (state is InitialState) {
                return Column(
                  children: [
                    SizedBox(
                      width: screenWidth * 0.92,
                      height: screenHeight / 12,
                      child: TextFormField(
                        controller: pass,
                        decoration: InputDecoration(
                          hintStyle: TextStyle(
                            color: ColorManager.hintTextColor,
                            fontSize: screenHeight * 0.02,
                          ),
                          border: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: ColorManager.hintTextColor),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: ColorManager.hintTextColor),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: ColorManager.hintTextColor),
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
                      ),
                    ),
                    SizedBox(
                      width: screenWidth * 0.92,
                      height: screenHeight / 12,
                      child: TextFormField(
                        controller: conf,
                        decoration: InputDecoration(
                          hintStyle: TextStyle(
                            color: ColorManager.hintTextColor,
                            fontSize: screenHeight * 0.02,
                          ),
                          border: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: ColorManager.hintTextColor),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: ColorManager.hintTextColor),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: ColorManager.hintTextColor),
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
                      ),
                    ),
                    SizedBox(
                      width: screenWidth * 0.92,
                      height: screenHeight / 12,
                      child: TextFormField(
                        controller: str,
                        decoration: InputDecoration(
                          hintStyle: TextStyle(
                            color: ColorManager.hintTextColor,
                            fontSize: screenHeight * 0.02,
                          ),
                          border: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: ColorManager.hintTextColor),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: ColorManager.hintTextColor),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: ColorManager.hintTextColor),
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
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AppButton(
                        text: "Create Wallet",
                        onPressed: () {
                          Wallet wallet = Wallet(
                              securityCode: pass.text,
                              confirmSecurityCode: conf.text,
                              bankAccount: str.text);
                          context.read<WalletCreationBloc>().add(
                                WalletCreationEvent(wallet: wallet),
                              );
                        },
                        backgroundColor: ColorManager.whiteColor,
                        width: screenWidth * 0.44,
                        height: screenHeight / 15,
                        textStyle: StylesManager.whiteButtonStyle,
                        hasIcon: false,
                      ),
                    ),
                  ],
                );
              } else {
           return     SizedBox();
              }
            },
          ),
        );
      }),
    );
  }
}
