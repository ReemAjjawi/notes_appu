import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ride_application/core/helper/indicator.dart';
import 'package:ride_application/features/categories/presentation/category_bloc/category_bloc.dart';
import '../../../../core/helper/build_app_bar.dart';
import '../../../../core/resources/managers/assets_manager.dart';
import '../../../../core/resources/managers/colors_manager.dart';
import '../../../../core/resources/managers/strings_manager.dart';
import '../../../../core/resources/managers/styles_manager.dart';
import '../../../../injection_file.dart';
import '../../../../main.dart';
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
        _buildSizeBox(),
        _buildText(),
        _buildSizeBox(),
        _buildGridView(),
      ],
    ),
  );
}

Widget _buildSizeBox() {
  return SizedBox(height: screenHeight * 0.02);
}

Widget _buildText() {
  return Text(
    StringsManager.SELECTYOURTRANSPORT,
    style: StylesManager.titleTextStyle,
  );
}

Widget _buildGridView() {
  final List<Map<String, String>> transportOptions = [
    {'iconPath': AssetsManager.bikeImage, 'label': StringsManager.CAR},
    {'iconPath': AssetsManager.bikeImage, 'label': StringsManager.BIKE},
    {'iconPath': AssetsManager.cycleImage, 'label': StringsManager.CYCLE},
    {'iconPath': AssetsManager.taxiImage, 'label': StringsManager.TAXI},
  ];
  return BlocBuilder<CategoryBloc, CategoriesClassState>(
    builder: (context, state) {
      if (state is Success){
      return Expanded(
        child: GridView.builder(
          itemCount: state.categories.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: screenWidth * 0.04,
            mainAxisSpacing: screenHeight * 0.02,
            childAspectRatio: 6 / 5,
          ),
          itemBuilder: (context, index) {
            final option = transportOptions[index];
            return InkWell(
              onTap: (){
                  Navigator.pushNamed(context, '/BicyclesScreen', arguments: state.categories[index].name);
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
                      state.categories[index].name!,
                      style: StylesManager.subLineStyle,
                    ),
                    SizedBox(height: screenHeight * 0.01),
                  ],
                ),
              ),
            );
          },
        ),
      );}
      else if (state is FailureState){
return Container(
  child: Text(
    state.message.toString()
  ),
);
      }
      else {
 return Indicator(); 
      }
     
    },
  );
}

void _onAppBarPressed(context) {
  Navigator.of(context).pop();
}
