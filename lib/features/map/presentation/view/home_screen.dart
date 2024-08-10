import 'package:flutter/material.dart';
import 'package:ride_application/core/helper/build_bottom_sheet.dart';
import 'package:ride_application/pages.dart';

import '../../data/model/hub_model.dart';

class HomeScreenArguments {
  final String categoryName;
  final HubModel hub;

  HomeScreenArguments({required this.categoryName, required this.hub});
}

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key, required this.hub, required this.categoryName});
  final HubModel hub;
  String categoryName;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: widgetOptions(widget.hub, widget.categoryName)
            .elementAt(selectedIndex),
      ),
      bottomNavigationBar: buildBottomNavigationBar(
        selectedIndex: selectedIndex,
        onItemTapped: onItemTapped,
      ),
    );
  }
}
