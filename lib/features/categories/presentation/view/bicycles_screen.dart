import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ride_application/core/helper/build_app_bar.dart';
import 'package:ride_application/core/helper/indicator.dart';
import 'package:ride_application/core/resources/managers/assets_manager.dart';
import 'package:ride_application/core/resources/managers/colors_manager.dart';
import 'package:ride_application/core/resources/managers/strings_manager.dart';
import 'package:ride_application/core/resources/managers/styles_manager.dart';
import 'package:ride_application/core/widgets/app_button.dart';
import 'package:ride_application/core/widgets/app_list_tile.dart';
import 'package:ride_application/features/categories/domain/repository/category_repository.dart';
import 'package:ride_application/features/categories/presentation/bicycle_bloc/bicycle_bloc.dart';
import 'package:ride_application/features/categories/presentation/bicycle_bloc/bicycle_event.dart';
import 'package:ride_application/features/categories/presentation/bicycle_bloc/bicycle_state.dart';
import 'package:ride_application/main.dart';

import '../../../../injection_file.dart';

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
          body: _buildBody(categoryName),
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

Widget _buildBody(categoryName) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      _buildText(),
      _buildSizeBox(),
      _buildText2(),
      _buildSizeBox(),
      _buildListView(categoryName),
    ],
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

Widget _buildListView(categoryName) {
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
      if (state is Success){
      return Expanded(
        child: ListView.builder(
          itemCount: state.bicycles.length,
          itemBuilder: (context, index) {
                        final bicycle = state.bicycles[index];

            final bicycleItem = bicycles[index];
            return Card(
              child: CustomListTile(
                height: screenHeight * 0.30,
                width: double.infinity,
                backgroundColor: ColorManager.scondaryColor,
                borderColor: ColorManager.borderColor,
                hasrawsubtitle: false,
                hasrawtitle: false,
                hascolum: true,
                title: Text(
                  bicycle.type!,
                  style: StylesManager.titleTextStyle,
                ),
                subtitle: Text(
                  StringsManager.INFOCAR,
                  style: StylesManager.subTitleStyle,
                ),
                subtitle2: Text(""),
                subtitle3: Row(
                  children: [
                    Icon(
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
                trailing: SizedBox(
                  width: screenWidth * 0.25,
                  height: screenHeight * 0.2,
                  child: Image.asset(bicycleItem['iconPath']!),
                ),
                subtitle4: AppButton(
                  text: StringsManager.VIEWBicycleLIST,
                  onPressed: (){
                     Navigator.pushNamed(context, '/map',arguments: categoryName);

                  },
                  backgroundColor: ColorManager.scondaryColor,
                  width: screenWidth * 0.88,
                  height: screenHeight / 15,
                  textStyle: TextStyle(
                    color: ColorManager.borderColor,
                    fontWeight: FontWeight.bold,
                  ),
                  hasIcon: false,
                ),
                subtitle5: Text(""),
              ),
            );
          },
        ),
      );}
      else if(state is FailureState)
      {
        return Container(
          child: 
          Text(
            state.message
          ),
        );}
        else {
          return Indicator();
        }
      
    },
  );
}

void _onAppBarPressed(context) {
  Navigator.of(context).pop();
}