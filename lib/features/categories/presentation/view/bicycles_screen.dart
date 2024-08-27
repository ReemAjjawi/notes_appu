import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helper/build_app_bar.dart';
import '../../../../core/helper/indicator.dart';
import '../../../../core/resources/managers/assets_manager.dart';
import '../../../../core/resources/managers/colors_manager.dart';
import '../../../../core/resources/managers/strings_manager.dart';
import '../../../../core/resources/managers/styles_manager.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_list_tile.dart';
import '../../../../injection_file.dart';
import '../../../../main.dart';
import '../bicycle_bloc/bicycle_bloc.dart';
import '../bicycle_bloc/bicycle_event.dart';
import '../bicycle_bloc/bicycle_state.dart';

class BicyclesScreen extends StatelessWidget {
  BicyclesScreen({super.key, required this.categoryName});

  String categoryName;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<BicycleBloc>(
      create: (context) =>
          sl()..add(GetBicycleEvent(categoryName: categoryName)),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: _buildAppBar(context),
          body: _buildBody(screenHeight, categoryName, screenWidth, isPortrait),
        );
      }),
    );
  }
}

PreferredSizeWidget _buildAppBar(BuildContext context) {
  return buildAppBar(
    hasLeading: true,
    onPressed: () => _onAppBarPressed(context),
  );
}

Widget _buildBody(
    double screenHeight, categoryName, double screenWidth, bool isPortrait) {
  return Padding(
    padding: EdgeInsets.all(padding),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildText(),
        _buildSizeBox(),
        _buildText2(),
        _buildSizeBox(),
        _buildListView(screenHeight, categoryName, screenWidth, isPortrait),
      ],
    ),
  );
}

Widget _buildText() {
  return Text(
    StringsManager.AVAIABLECARSFORRIDE,
    style: StylesManager.titleTextStyle,
  );
}

Widget _buildSizeBox() {
  return SizedBox(height: screenHeight * 0.02);
}

Widget _buildText2() {
  return Text(
    StringsManager.CARSFOUND,
    style: StylesManager.subTitleStyle,
  );
}

Widget _buildListView(
    double screenHeight, categoryName, double screenWidth, bool isPortrait) {
  final List<Map<String, String>> bicycles = [
    {'iconPath': AssetsManager.bmwImage, 'name': StringsManager.BMWCABRIO},
    {
      'iconPath': AssetsManager.mustangImage,
      'name': StringsManager.MUSTANGSHELBYGT
    },
    {'iconPath': AssetsManager.bmwRedImage, 'name': StringsManager.BMW18},
    {
      'iconPath': AssetsManager.jaguarImage,
      'name': StringsManager.JAGUARSILBER
    },
  ];
  return BlocBuilder<BicycleBloc, BicyclesClassState>(
    builder: (context, state) {
      if (state is Success) {
        return Expanded(
          child: ListView.builder(
            itemCount: state.bicycles.data.length,
            itemBuilder: (context, index) {
              final bicycle = state.bicycles.data[index];

              final bicycleItem = bicycles[index];
              return Card(
                child: CustomListTile(
                  height: isPortrait ? screenHeight / 4 : screenHeight / 2,
                  width: double.infinity,
                  backgroundColor: ColorManager.scondaryColor,
                  borderColor: ColorManager.borderColor,
                  hasrawsubtitle: false,
                  hasrawtitle: false,
                  hascolum: true,
                  trailing: SizedBox(
                    width: isPortrait ? screenWidth * 0.25 : screenWidth * 0.15,
                    height:
                        isPortrait ? screenHeight * 0.2 : screenHeight * 0.15,
                    child: Image.asset(bicycleItem['iconPath']!),
                  ),
                  title: Text(
                    bicycle.type,
                    style: StylesManager.titleTextStyle,
                  ),
                  subtitle: Text(
                    StringsManager.INFOCAR,
                    style: StylesManager.subTitleStyle,
                  ),
                  subtitle2: const Text(""),
                  subtitle3: Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: ColorManager.underHintTextColor,
                      ),
                      SizedBox(width: screenWidth * 0.01),
                      Text(
                        StringsManager.DESTANCE,
                        style: StylesManager.underHintTextStyle,
                      ),
                    ],
                  ),
                  subtitle4: AppButton(
                    text: StringsManager.VIEWBicycleLIST,
                    onPressed: () {
                      Navigator.pushNamed(context, '/LocationScreen',
                          arguments: categoryName);
                    },
                    backgroundColor: ColorManager.scondaryColor,
                    width: screenWidth * 0.50,
                    height: screenHeight / 20,
                    textStyle: const TextStyle(
                      color: ColorManager.borderColor,
                      fontWeight: FontWeight.bold,
                    ),
                    hasIcon: false,
                  ),
                  subtitle5: const Text(""),
                ),
              );
            },
          ),
        );
      } else if (state is FailureState) {
        return Text(state.message);
      } else {
        return const Center(child: Indicator());
      }
    },
  );
}

void _onAppBarPressed(context) {
  Navigator.of(context).pop();
}
