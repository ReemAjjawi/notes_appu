import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickalert/quickalert.dart';
import 'package:ride_application/core/helper/build_app_bar.dart';
import 'package:ride_application/core/resources/managers/assets_manager.dart';
import 'package:ride_application/core/resources/managers/colors_manager.dart';
import 'package:ride_application/core/resources/managers/strings_manager.dart';
import 'package:ride_application/core/resources/managers/styles_manager.dart';
import 'package:ride_application/core/widgets/app_list_tile.dart';
import 'package:ride_application/core/widgets/app_text_field.dart';
import 'package:ride_application/features/add_money/presentation/bloc/add_money_bloc/add_money_bloc.dart';
import 'package:ride_application/main.dart';

import '../../../../core/widgets/app_button.dart';
import '../../../../injection_file.dart';
import '../../data/model/code_model.dart';
import '../bloc/add_money_bloc/add_money_event.dart';
import '../bloc/add_money_bloc/add_money_state.dart';

class AddMoneyScreen extends StatelessWidget {
  AddMoneyScreen({super.key, required this.code});
  String code;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddMoneyBloc(sl()),
      child: Builder(builder: (context) {
        return Scaffold(
            appBar: _buildAppBar(context),
            body:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              _buildSizeBox2(screenHeight),
              _buildTextFormField(code),
              _buildSizeBox(screenHeight),
              _buildTextButton(code),
              _buildSizeBox2(screenHeight),
              _buildText(),
              _buildSizeBox(screenHeight),
              _buildListView(screenHeight, screenWidth),
              _buildSizeBox2(screenHeight),
              _buildSizeBox2(screenHeight),
              BlocConsumer<AddMoneyBloc, AddMoneyClassState>(
                listener: (context, state) async {
                  if (state is FailureState) {
                    await QuickAlert.show(
                      context: context,
                      type: QuickAlertType.error,
                      title: 'Error',
                      text: state.message,
                    );

                    Navigator.pushNamed(context, '/AddMoneyScreen');
                  } else if (state is SuccessState) {
                    Navigator.pushNamed(context, '/SuccessScreen',
                        arguments: state.model);
                  } else if (state is LoadingState) {
                    QuickAlert.show(
                      context: context,
                      type: QuickAlertType.loading,
                    );
                  }
                },
                builder: (context, state) {
                  if (state is InitialState) {
                    return SizedBox(
                      width: double.infinity,
                      child: AppButton(
                        text: StringsManager.CONFIRM,
                        onPressed: () {
                          context.read<AddMoneyBloc>().add(
                                AddMoneyEvent(code: code),
                              );
                        },
                        backgroundColor: ColorManager.primaryColor,
                        width: screenWidth * 0.88,
                        height: screenHeight / 15,
                        textStyle: StylesManager.greenButtonStyle,
                        hasIcon: false,
                      ),
                    );
                  } else {
                    return SizedBox();
                  }
                },
              ),
            ]));
      }),
    );
  }

  Widget _buildListView(double screenHeight, double screenWidth) {
    final List<Map<String, String>> payment = [
      {
        'Image': AssetsManager.visaImage,
        'name': StringsManager.VISANUMBER,
        'date': StringsManager.SUBVISANUMBER
      },
      {
        'Image': AssetsManager.mastercardImage,
        'name': StringsManager.VISANUMBER,
        'date': StringsManager.SUBVISANUMBER
      },
      {
        'Image': AssetsManager.mailaddressImage,
        'name': StringsManager.MAILADDRESS,
        'date': StringsManager.SUBVISANUMBER
      },
      {
        'Image': AssetsManager.cashImage,
        'name': StringsManager.CASH,
        'date': StringsManager.SUBVISANUMBER
      },
    ];

    return Expanded(
      child: ListView.builder(
        itemCount: payment.length,
        itemBuilder: (context, index) {
          return Card(
            child: CustomListTile(
              leading: Image(image: AssetImage(payment[index]['Image']!)),
              title: Text(payment[index]['name']!,
                  style: StylesManager.titleTextStyle),
              subtitle: Text(payment[index]['date']!,
                  style: StylesManager.subTitleStyle),
              backgroundColor: ColorManager.scondaryColor,
              borderColor: ColorManager.borderColor,
              height: screenHeight * 0.1,
              width: screenWidth,
              hasrawtitle: false,
              hasrawsubtitle: false,
              hascolum: false,
            ),
          );
        },
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return buildAppBar(
      hasLeading: true,
      title: Text(StringsManager.AMOUNT),
      onPressed: () => _onAppBarPressed(context),
    );
  }

  Widget _buildSizeBox(double screenHeight) {
    return SizedBox(height: screenHeight * 0.02);
  }

  Widget _buildTextFormField(code) {
    return Center(
      child: CustomTextFormField(
        hintText: code,
        colorborder: ColorManager.hintTextColor,
        width: screenWidth * 0.88,
        height: screenHeight / 15,
      ),
    );
  }

  Widget _buildSizeBox2(double screenHeight) {
    return SizedBox(height: screenHeight * 0.05);
  }

  Widget _buildText() {
    return Text(
      StringsManager.SELECTPAYMENTMETHOD,
      style: StylesManager.headLineStyle,
    );
  }

  Widget _buildTextButton(String code) {
    return Align(
      alignment: Alignment.topRight,
      child: TextButton(
        onPressed: () {
          print(code);
        },
        child: Text(
          StringsManager.ADDPAYMENTMETHOD,
          style: TextStyle(color: ColorManager.borderColor),
        ),
      ),
    );
  }

  void _onAppBarPressed(context) {
    Navigator.of(context).pop();
  }
}
