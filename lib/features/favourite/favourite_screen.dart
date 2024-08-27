import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/helper/build_app_bar.dart';
import '../../core/resources/managers/colors_manager.dart';
import '../../core/resources/managers/strings_manager.dart';
import '../../core/resources/managers/styles_manager.dart';
import '../../core/widgets/app_list_tile.dart';
import '../../main.dart';

class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context, screenWidth, screenHeight),
      body: _buildBody(screenWidth, screenHeight),
    );
  }
}

PreferredSizeWidget _buildAppBar(
    BuildContext context, double screenWidth, double screenHeight) {
  return buildAppBar(
    title: Text(
      StringsManager.FAVOURITE,
      style: StylesManager.titleTextStyle,
    ),
    leadingg: Container(
      width: screenWidth * 0.08,
      height: screenHeight * 0.04,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: ColorManager.scondaryColor,
      ),
      child: const Icon(
        Icons.menu,
      ),
    ),
  );
}

Widget _buildBody(double screenWidth, double screenHeight) {
  return Column(
    children: [
      _buildSizeBox(screenHeight),
      _buildListView(screenWidth, screenHeight),
    ],
  );
}

Widget _buildSizeBox(double screenHeight) {
  return SizedBox(height: screenHeight * 0.05);
}

Widget _buildListView(double screenWidth, double screenHeight) {
  final List<Map<String, String>> favoritePlaces = [
    {'type': StringsManager.OFFICE, 'address': StringsManager.SUBOFFICE},
    {'type': StringsManager.HOME, 'address': StringsManager.SUBOFFICE},
    {'type': StringsManager.OFFICE, 'address': StringsManager.SUBOFFICE},
    {'type': StringsManager.HOUSE, 'address': StringsManager.SUBOFFICE},
    {'type': StringsManager.HOME, 'address': StringsManager.SUBOFFICE},
    {'type': StringsManager.OFFICE, 'address': StringsManager.SUBOFFICE},
    {'type': StringsManager.HOUSE, 'address': StringsManager.SUBOFFICE},
  ];
  return Expanded(
    child: ListView.builder(
      itemCount: favoritePlaces.length,
      itemBuilder: (context, index) {
        return Card(
          child: CustomListTile(
            leading: const Icon(Icons.location_on),
            title: Text(
              favoritePlaces[index]['type']!,
              style: StylesManager.titleTextStyle,
            ),
            subtitle: Text(
              favoritePlaces[index]['address']!,
              style: StylesManager.subTitleStyle,
            ),
            trailing: IconButton(
              icon: Icon(isIos ? CupertinoIcons.delete : Icons.delete,
                  color: ColorManager.cancelColor),
              onPressed: () {},
            ),
            backgroundColor: Colors.white,
            borderColor: Colors.grey,
            height: screenHeight / 7,
            width: screenWidth * 0.9,
            hasrawtitle: false,
            hasrawsubtitle: false,
            hascolum: false,
          ),
        );
      },
    ),
  );
}
