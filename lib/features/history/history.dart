import 'package:flutter/material.dart';
import 'package:ride_application/core/resources/managers/colors_manager.dart';

import '../../../../core/helper/build_app_bar.dart';
import '../../../../core/resources/managers/assets_manager.dart';
import '../../../../core/resources/managers/strings_manager.dart';
import '../../../../core/resources/managers/styles_manager.dart';
import '../../../../core/widgets/app_list_tile.dart';
import '../../../../main.dart';

class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> with SingleTickerProviderStateMixin {
  late TabController tabController;
  late ValueNotifier<int> selectedTabNotifier;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
    selectedTabNotifier = ValueNotifier<int>(tabController.index);

    tabController.addListener(() {
      selectedTabNotifier.value = tabController.index;
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    selectedTabNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        hasLeading: true,
        title: const Text(StringsManager.HISTORY),
        onPressed: () => _onAppBarPressed(context),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(screenHeight * 0.08),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
            decoration: BoxDecoration(
              color: ColorManager.scondaryColor,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: ColorManager.borderColor),
            ),
            child: TabBar(
              controller: tabController,
              indicator: BoxDecoration(
                color: ColorManager.primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              labelColor: ColorManager.whiteColor,
              unselectedLabelColor: Colors.black,
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: [
                Tab(text: StringsManager.UPCOMING),
                Tab(text: StringsManager.COMPLETED),
                Tab(text: StringsManager.CANCELLED),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: screenHeight * 0.02),
          ValueListenableBuilder<int>(
            valueListenable: selectedTabNotifier,
            builder: (context, index, _) {
              return Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: [
                    _buildListView(screenHeight), 
                   _buildListView2(screenHeight), 
                    _buildListView3(screenHeight),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  void _onAppBarPressed(context) {
    Navigator.of(context).pop();
  }

  Widget _buildListView(double screenHeight) {
    final List<Map<String, String>> wallet = [
      {
        'title': StringsManager.NATE,
        'subtitle': StringsManager.MUSTANGSHELBYGT,
        'trailing': StringsManager.TODAYATHOUR9
      },
      {
        'title': StringsManager.HANRY,
        'subtitle': StringsManager.MUSTANGSHELBYGT,
        'trailing': StringsManager.TODAYATHOUR10
      },
      {
        'title': StringsManager.WILLAM,
        'subtitle': StringsManager.MUSTANGSHELBYGT,
        'trailing': StringsManager.TOMORROWATHOUR
      },
      {
        'title': StringsManager.NATE,
        'subtitle': StringsManager.MUSTANGSHELBYGT,
        'trailing': StringsManager.TODAYATHOUR9
      },
      {
        'title': StringsManager.HANRY,
        'subtitle': StringsManager.MUSTANGSHELBYGT,
        'trailing': StringsManager.TODAYATHOUR10
      },
      {
        'title': StringsManager.WILLAM,
        'subtitle': StringsManager.MUSTANGSHELBYGT,
        'trailing': StringsManager.TOMORROWATHOUR
      },
      {
        'title': StringsManager.HANRY,
        'subtitle': StringsManager.MUSTANGSHELBYGT,
        'trailing': StringsManager.TODAYATHOUR9
      },
       {
        'title': StringsManager.WILLAM,
        'subtitle': StringsManager.MUSTANGSHELBYGT,
        'trailing': StringsManager.TODAYATHOUR10
      },
    ];

    return ListView.builder(
      itemCount: wallet.length,
      itemBuilder: (context, index) {
        return Card(
          child: CustomListTile(
            title: Text(wallet[index]['title']!,
                style: StylesManager.titleTextStyle),
            subtitle: Text(wallet[index]['subtitle']!,
                style: StylesManager.subTitleStyle),
            trailing: Text(wallet[index]['trailing']!,
                style: StylesManager.titleTextStyle),
            backgroundColor: Colors.white,
            borderColor: ColorManager.borderColor,
            height: screenHeight * 0.1,
            width: double.infinity,
            hasrawtitle: false,
            hasrawsubtitle: false,
            hascolum: false,
          ),
        );
      },
    );
  }

   Widget _buildListView2(double screenHeight) {
    final List<Map<String, String>> wallet = [
      {
        'title': StringsManager.NATE,
        'subtitle': StringsManager.MUSTANGSHELBYGT,
        'trailing': StringsManager.DONE
      },
      {
        'title': StringsManager.HANRY,
        'subtitle': StringsManager.MUSTANGSHELBYGT,
        'trailing': StringsManager.DONE
      },
      {
        'title': StringsManager.WILLAM,
        'subtitle': StringsManager.MUSTANGSHELBYGT,
        'trailing': StringsManager.DONE
      },
      {
        'title': StringsManager.NATE,
        'subtitle': StringsManager.MUSTANGSHELBYGT,
        'trailing': StringsManager.DONE
      },
      {
        'title': StringsManager.HANRY,
        'subtitle': StringsManager.MUSTANGSHELBYGT,
        'trailing': StringsManager.DONE
      },
      {
        'title': StringsManager.WILLAM,
        'subtitle': StringsManager.MUSTANGSHELBYGT,
        'trailing': StringsManager.DONE
      },
      {
        'title': StringsManager.HANRY,
        'subtitle': StringsManager.MUSTANGSHELBYGT,
        'trailing': StringsManager.DONE
      },
       {
        'title': StringsManager.WILLAM,
        'subtitle': StringsManager.MUSTANGSHELBYGT,
        'trailing': StringsManager.DONE
      },
    ];

    return ListView.builder(
      itemCount: wallet.length,
      itemBuilder: (context, index) {
        return Card(
          child: CustomListTile(
            title: Text(wallet[index]['title']!,
                style: StylesManager.titleTextStyle),
            subtitle: Text(wallet[index]['subtitle']!,
                style: StylesManager.subTitleStyle),
            trailing: Text(wallet[index]['trailing']!,
                style: StylesManager.doneStyle),
            backgroundColor: Colors.white,
            borderColor: ColorManager.borderColor,
            height: screenHeight * 0.1,
            width: double.infinity,
            hasrawtitle: false,
            hasrawsubtitle: false,
            hascolum: false,
          ),
        );
      },
    );
  }

  Widget _buildListView3(double screenHeight) {
    final List<Map<String, String>> wallet = [
      {
        'title': StringsManager.NATE,
        'subtitle': StringsManager.MUSTANGSHELBYGT,
        'trailing': StringsManager.DELETE
      },
      {
        'title': StringsManager.HANRY,
        'subtitle': StringsManager.MUSTANGSHELBYGT,
        'trailing': StringsManager.DELETE
      },
      {
        'title': StringsManager.WILLAM,
        'subtitle': StringsManager.MUSTANGSHELBYGT,
        'trailing': StringsManager.DELETE
      },
      {
        'title': StringsManager.NATE,
        'subtitle': StringsManager.MUSTANGSHELBYGT,
        'trailing': StringsManager.DELETE
      },
      {
        'title': StringsManager.HANRY,
        'subtitle': StringsManager.MUSTANGSHELBYGT,
        'trailing': StringsManager.DELETE
      },
      {
        'title': StringsManager.WILLAM,
        'subtitle': StringsManager.MUSTANGSHELBYGT,
        'trailing': StringsManager.DELETE
      },
      {
        'title': StringsManager.HANRY,
        'subtitle': StringsManager.MUSTANGSHELBYGT,
        'trailing': StringsManager.DELETE
      },
       {
        'title': StringsManager.WILLAM,
        'subtitle': StringsManager.MUSTANGSHELBYGT,
        'trailing': StringsManager.DELETE
      },
    ];

    return ListView.builder(
      itemCount: wallet.length,
      itemBuilder: (context, index) {
        return Card(
          child: CustomListTile(
            title: Text(wallet[index]['title']!,
                style: StylesManager.titleTextStyle),
            subtitle: Text(wallet[index]['subtitle']!,
                style: StylesManager.subTitleStyle),
            trailing: Text(wallet[index]['trailing']!,
                style: StylesManager.deleteStyle),
            backgroundColor: Colors.white,
            borderColor: ColorManager.borderColor,
            height: screenHeight * 0.1,
            width: double.infinity,
            hasrawtitle: false,
            hasrawsubtitle: false,
            hascolum: false,
          ),
        );
      },
    );
  } 
  
}
