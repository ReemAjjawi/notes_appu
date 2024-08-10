// ignore_for_file: public_member_api_docs, sort_constructors_first
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
import 'package:ride_application/features/hub_content/presentation/hub_contents_bloc/hub_contents_state.dart';
import 'package:ride_application/main.dart';

import '../../../../injection_file.dart';
import '../../../map/data/model/hubinfo_model.dart';
import '../hub_contents_bloc/hub_contens_bloc.dart';
import '../hub_contents_bloc/hub_contents_event.dart';
import 'bicycle_details_screen.dart';

class BicyclesFromCategorey extends StatelessWidget {
  HubinfoModel hubId;
  HubinfoModel hubIdto;
  String categoryName;
  BicyclesFromCategorey({
    Key? key,
    required this.hubId,
    required this.hubIdto,
    required this.categoryName,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HubContentsBloc>(
      create: (context) =>
          sl()..add(GetHubContentsEvent(hubId.id as int, categoryName)),
      child: Builder(builder: (context) {
        return Scaffold(
            appBar: _buildAppBar(context),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildText(),
                  _buildSizeBox(),
                  _buildText2(),
                  _buildSizeBox(),
                  buildListView(hubId, hubIdto),
                ],
              ),
            ));
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

Widget buildListView(hubId, hubIdto) {
  return BlocBuilder<HubContentsBloc, HubContentsClassState>(
      builder: (context, state) {
    if (state is Success) {
      return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: state.bicycles.length,
        itemBuilder: (context, index) {
          final bicycle = state.bicycles[index];
          return InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                '/BicycleDetailsScreen',
                arguments: DetailArguments(
                  bicycle: bicycle,
                  hubId: hubId,
                  hubIdto: hubIdto,
                ),
              );
            },
            child: Card(
              child: CustomListTile(
                height: screenHeight * 0.35,
                width: double.infinity,
                backgroundColor: ColorManager.scondaryColor,
                borderColor: ColorManager.borderColor,
                hasrawsubtitle: false,
                hasrawtitle: false,
                hascolum: true,
                title: Text(
                  bicycle.type,
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
                trailing: Container(
                  width: screenWidth * 0.25,
                  height: screenHeight * 0.8,
                  child: Image.asset(
                    AssetsManager.bmwImage,
                    // fit: BoxFit.cover,
                  ),
                ),
                subtitle4: AppButton(
                  text: StringsManager.BOOKLATER,
                  onPressed: () {},
                  backgroundColor: ColorManager.scondaryColor,
                  width: screenWidth * 0.44,
                  height: screenHeight / 15,
                  textStyle: StylesManager.whiteButtonStyle,
                  hasIcon: false,
                ),
                subtitle5: AppButton(
                  text: StringsManager.RIDENOW,
                  onPressed: () {},
                  backgroundColor: ColorManager.primaryColor,
                  width: screenWidth * 0.44,
                  height: screenHeight / 15,
                  textStyle: StylesManager.greenButtonStyle,
                  hasIcon: false,
                ),
              ),
            ),
          );
        },
      );
    } else if (state is LoadingState) {
      return Center(
        child: Indicator(),
      );
    } else {
      return Container(
        child: Text((state as FailureState).message),
      );
    }
  });
}

void _onAppBarPressed(context) {
  Navigator.of(context).pop();
}
