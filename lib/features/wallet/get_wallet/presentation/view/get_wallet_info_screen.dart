

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickalert/quickalert.dart';
import 'package:ride_application/core/helper/build_app_bar.dart';
import 'package:ride_application/core/resources/managers/assets_manager.dart';
import 'package:ride_application/core/resources/managers/colors_manager.dart';
import 'package:ride_application/core/resources/managers/strings_manager.dart';
import 'package:ride_application/core/resources/managers/styles_manager.dart';
import 'package:ride_application/core/widgets/app_button.dart';
import 'package:ride_application/core/widgets/app_list_tile.dart';
import 'package:ride_application/main.dart';

import '../../../../../injection_file.dart';
import '../../../get_valid_codes/presentation/bloc/codes_list_bloc.dart';
import '../../../get_valid_codes/presentation/bloc/codes_list_event.dart';
import '../../../get_valid_codes/presentation/bloc/codes_list_state.dart';
import '../bloc/wallet_info_bloc.dart';
import '../bloc/wallet_info_event.dart';
import '../bloc/wallet_info_state.dart';

class WalletScreen extends StatelessWidget {
  WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => WalletInfoBloc(sl())..add(WalletInfoEvent()),
        ),
        BlocProvider(
          create: (context) => CodesListBloc(sl())..add(CodesListEvent()),
        ),
      ],
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: _buildAppBar(context, screenWidth),
          body: _buildBody(screenWidth, screenHeight, isPortrait),
        );
      }),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context, double screenWidth) {
    return buildAppBar(
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
    );
  }

  Widget _buildBody(double screenWidth, double screenHeight, bool isPortrait) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        _buildSizeBox(screenHeight),
        // _buildAppButton(screenWidth, screenHeight),
        _buildSizeBox(screenHeight),
        if (isPortrait) _buildRow(screenWidth, screenHeight),
        if (!isPortrait) _buildRowLandscape(screenWidth, screenHeight),
        _buildSizeBox(screenHeight),
        _buildRow2(),
        _buildSizeBox(screenHeight),
        _buildListView(screenHeight),
      ],
    );
  }

  Widget _buildSizeBox(double screenHeight) {
    return SizedBox(height: screenHeight * 0.02);
  }

  Widget _buildAppButton(double screenWidth, double screenHeight) {
    return AppButton(
      text: StringsManager.ADDMONEY,
      onPressed: wiee,
      backgroundColor: ColorManager.whiteColor,
      width: screenWidth * 0.44,
      height: screenHeight / 15,
      textStyle: StylesManager.whiteButtonStyle,
      hasIcon: false,
    );
  }

  Widget _buildRow(double screenWidth, double screenHeight) {
    return BlocBuilder<WalletInfoBloc, WalletInfoClassState>(
      builder: (context, state) {
        if (state is SuccessState) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: screenWidth * 0.4,
                height: screenHeight * 0.18,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: ColorManager.scondaryColor,
                  border: Border.all(color: ColorManager.borderColor),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      state.walletInfo.balance.toString(),
                      style: StylesManager.headLineStyle,
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Text(
                      StringsManager.AVAILABLEBALANCE,
                    ),
                  ],
                ),
              ),
              Container(
                width: screenWidth * 0.4,
                height: screenHeight * 0.18,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: ColorManager.scondaryColor,
                  border: Border.all(color: ColorManager.borderColor),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "\$200",
                      style: StylesManager.headLineStyle,
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Text(
                      StringsManager.TOTALEXPEND,
                    ),
                  ],
                ),
              ),
            ],
          );
        } else {
          return SizedBox();
        }
      },
    );
  }

  Widget _buildRowLandscape(double screenWidth, double screenHeight) {
    return Column(
      children: [
        _buildRow(screenWidth, screenHeight),
        SizedBox(height: screenHeight * 0.02),
        _buildRow(screenWidth, screenHeight),
      ],
    );
  }

  Widget _buildRow2() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          StringsManager.TRANSECTIONS,
          style: StylesManager.headLineStyle,
        ),
        Text(
          StringsManager.SEEALL,
          style: StylesManager.whiteButtonStyle,
        ),
      ],
    );
  }

  Widget _buildListView(double screenHeight) {
    final List<Map<String, String>> wallet = [
      {
        'Image': AssetsManager.upImage,
        'name': StringsManager.WELTON,
        'date': StringsManager.TOMORROWATHOUR,
        'price': StringsManager.WELTONNUMBER
      },
      {
        'Image': AssetsManager.downImage,
        'name': StringsManager.NATHSAM,
        'date': StringsManager.TOMORROWATHOUR,
        'price': StringsManager.NATHSAMNUMBER
      },
      {
        'Image': AssetsManager.upImage,
        'name': StringsManager.WELTON,
        'date': StringsManager.TOMORROWATHOUR,
        'price': StringsManager.WELTONNUMBER
      },
      {
        'Image': AssetsManager.downImage,
        'name': StringsManager.NATHSAM,
        'date': StringsManager.TOMORROWATHOUR,
        'price': StringsManager.NATHSAMNUMBER
      },
      {
        'Image': AssetsManager.upImage,
        'name': StringsManager.WELTON,
        'date': StringsManager.TOMORROWATHOUR,
        'price': StringsManager.WELTONNUMBER
      },
      {
        'Image': AssetsManager.downImage,
        'name': StringsManager.NATHSAM,
        'date': StringsManager.TOMORROWATHOUR,
        'price': StringsManager.NATHSAMNUMBER
      },
      {
        'Image': AssetsManager.upImage,
        'name': StringsManager.WELTON,
        'date': StringsManager.TOMORROWATHOUR,
        'price': StringsManager.WELTONNUMBER
      },
        {
        'Image': AssetsManager.upImage,
        'name': StringsManager.WELTON,
        'date': StringsManager.TOMORROWATHOUR,
        'price': StringsManager.WELTONNUMBER
      },
        {
        'Image': AssetsManager.upImage,
        'name': StringsManager.WELTON,
        'date': StringsManager.TOMORROWATHOUR,
        'price': StringsManager.WELTONNUMBER
      },
        {
        'Image': AssetsManager.upImage,
        'name': StringsManager.WELTON,
        'date': StringsManager.TOMORROWATHOUR,
        'price': StringsManager.WELTONNUMBER
      },
        {
        'Image': AssetsManager.upImage,
        'name': StringsManager.WELTON,
        'date': StringsManager.TOMORROWATHOUR,
        'price': StringsManager.WELTONNUMBER
      },
        {
        'Image': AssetsManager.upImage,
        'name': StringsManager.WELTON,
        'date': StringsManager.TOMORROWATHOUR,
        'price': StringsManager.WELTONNUMBER
      },
        {
        'Image': AssetsManager.upImage,
        'name': StringsManager.WELTON,
        'date': StringsManager.TOMORROWATHOUR,
        'price': StringsManager.WELTONNUMBER
      },
        {
        'Image': AssetsManager.upImage,
        'name': StringsManager.WELTON,
        'date': StringsManager.TOMORROWATHOUR,
        'price': StringsManager.WELTONNUMBER
      },
        {
        'Image': AssetsManager.upImage,
        'name': StringsManager.WELTON,
        'date': StringsManager.TOMORROWATHOUR,
        'price': StringsManager.WELTONNUMBER
      },
        {
        'Image': AssetsManager.upImage,
        'name': StringsManager.WELTON,
        'date': StringsManager.TOMORROWATHOUR,
        'price': StringsManager.WELTONNUMBER
      },
        {
        'Image': AssetsManager.upImage,
        'name': StringsManager.WELTON,
        'date': StringsManager.TOMORROWATHOUR,
        'price': StringsManager.WELTONNUMBER
      },
        {
        'Image': AssetsManager.upImage,
        'name': StringsManager.WELTON,
        'date': StringsManager.TOMORROWATHOUR,
        'price': StringsManager.WELTONNUMBER
      },
        {
        'Image': AssetsManager.upImage,
        'name': StringsManager.WELTON,
        'date': StringsManager.TOMORROWATHOUR,
        'price': StringsManager.WELTONNUMBER
      },
        {
        'Image': AssetsManager.upImage,
        'name': StringsManager.WELTON,
        'date': StringsManager.TOMORROWATHOUR,
        'price': StringsManager.WELTONNUMBER
      },
        {
        'Image': AssetsManager.upImage,
        'name': StringsManager.WELTON,
        'date': StringsManager.TOMORROWATHOUR,
        'price': StringsManager.WELTONNUMBER
      },
    ];

    return BlocConsumer<CodesListBloc, CodesListClassState>(
      listener: (context, state) async {
        if (state is FailureStateCodesList) {
          await QuickAlert.show(
            context: context,
            type: QuickAlertType.error,
            title: 'Error',
            text: state.message,
          );

          Navigator.pushNamed(context, '/CreateWalletScreen');
        } else if (state is LoadingStateCodesList) {
  await        QuickAlert.show(
            context: context,
            type: QuickAlertType.loading,
          );
        }
      },
      builder: (context, state) {
        if (state is SuccessStateCodesList) {
          return Expanded(
            child: ListView.builder(
              itemCount: state.codesInfo.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/AddMoneyScreen',
                        arguments: state.codesInfo[index].code);
                  },
                  child: Card(
                    child: CustomListTile(
                      leading:
                          Image(image: AssetImage(wallet[index]['Image']!)),
                      title: Text(wallet[index]['name']!,
                          style: StylesManager.titleTextStyle),
                      subtitle: Text(wallet[index]['date']!,
                          style: StylesManager.subTitleStyle),
                      trailing: Text(state.codesInfo[index].amount.toString()!,
                          style: StylesManager.titleTextStyle),
                      backgroundColor: Colors.white,
                      borderColor: Colors.grey,
                      height: screenHeight * 0.1,
                      width: double.infinity,
                      hasrawtitle: false,
                      hasrawsubtitle: false,
                      hascolum: false,
                    ),
                  ),
                );
              },
            ),
          );
        } else {
          return SizedBox();
        }
      },
    );
  }

  void wiee() {}
}
