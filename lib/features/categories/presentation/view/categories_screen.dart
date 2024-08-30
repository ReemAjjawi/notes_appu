import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickalert/quickalert.dart';

import '../../../../config/local_nafication.dart';
import '../../../../core/helper/build_app_bar.dart';
import '../../../../core/helper/indicator.dart';
import '../../../../core/resources/managers/assets_manager.dart';
import '../../../../core/resources/managers/colors_manager.dart';
import '../../../../core/resources/managers/strings_manager.dart';
import '../../../../core/resources/managers/styles_manager.dart';
import '../../../../injection_file.dart';
import '../../../../main.dart';
import '../category_bloc/category_bloc.dart';
import '../category_bloc/category_event.dart';
import '../category_bloc/category_state.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CategoryBloc>(
      create: (context) => sl()..add(GetCategoryEvent()),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: _buildAppBar(context),
          body: _buildBody(),
        );
      }),
    );
  }
}

PreferredSizeWidget _buildAppBar(BuildContext context) {
  return buildAppBar(
    hasLeading: true,
    onPressed: () => _onAppBarPressed(context),
    title: Text(
      StringsManager.SELECTTRANSPORT,
      style: StylesManager.headLineStyle,
    ),
  );
}

Widget _buildBody() {
  return Center(
    child: Column(
      //  crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildSizeBox(screenHeight),
        _buildText(),
        _buildSizeBox(screenHeight),
        _buildGridView(screenWidth, screenHeight, isPortrait),
      ],
    ),
  );
}

Widget _buildSizeBox(screenHeight) {
  return SizedBox(height: screenHeight * 0.02);
}

Widget _buildText() {
  return Text(
    StringsManager.SELECTYOURTRANSPORT,
    style: StylesManager.titleTextStyle,
  );
}

Widget _buildGridView(
    double screenWidth, double screenHeight, bool isPortrait) {
  final List<Map<String, String>> transportOptions = [
    {'iconPath': AssetsManager.bikeImage, 'label': StringsManager.CAR},
    {'iconPath': AssetsManager.bikeImage, 'label': StringsManager.BIKE},
    {'iconPath': AssetsManager.cycleImage, 'label': StringsManager.CYCLE},
    {'iconPath': AssetsManager.taxiImage, 'label': StringsManager.TAXI},
  ];
  return BlocConsumer<CategoryBloc, CategoriesClassState>(
    listener: (context, state) async {
      if (state is FailureStateca) {
        await QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          title: 'Error',
          text: state.message,
        );
        Navigator.pushNamed(context, '/CategoriesScreen');
      }

      if (state is unknowStateca) {
        await QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          title: 'Error',
          text: state.message,
        );
        Navigator.pushNamed(context, '/CategoriesScreen');
      }
      if (state is internetStateca) {
        await QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          title: 'Errorinternet',
          text: state.message,
        );
        Navigator.pushNamed(context, '/CategoriesScreen');
      }
    },
    builder: (context, state) {
      if (state is Success) {
        return Expanded(
          child: Padding(
            padding: EdgeInsets.all(padding),
            child: GridView.builder(
              itemCount: state.categories.data.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: isPortrait ? 2 : 3,
                crossAxisSpacing: screenWidth * 0.04,
                mainAxisSpacing: screenHeight * 0.02,
                childAspectRatio: isPortrait ? (6 / 5) : (6 / 4),
              ),
              itemBuilder: (context, index) {
                final option = transportOptions[index];
                return InkWell(
                  onTap: () {
                    // LocalNotification.localNotification();
                    Navigator.pushNamed(context, '/BicyclesScreen',
                        arguments: state.categories.data[index].name);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: ColorManager.scondaryColor,
                      border: Border.all(
                        //bordercolor
                        color: ColorManager.titleColor,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          option['iconPath']!,
                          width: screenWidth * 0.15,
                          height: screenWidth * 0.15,
                        ),
                        SizedBox(height: screenHeight * 0.01),
                        Text(
                          state.categories.data[index].name,
                          style: StylesManager.subLineStyle,
                        ),
                        SizedBox(height: screenHeight * 0.01),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        );
      } else if (state is LoadingStateca) {
        //  QuickAlert.show(context: context, type: QuickAlertType.loading);
        return const Center(child: Indicator());
      } else {
        return const Center();
      }
    },
  );
}

void _onAppBarPressed(context) {
  Navigator.of(context).pop();
}
