import 'package:flutter/material.dart';
import 'package:ride_application/core/resources/managers/colors_manager.dart';
import 'package:ride_application/core/widgets/HexagonPainter.dart';
import 'package:ride_application/main.dart';

Widget buildBottomNavigationBar({
  required int selectedIndex,
  required ValueChanged<int> onItemTapped,
}) {
  return Stack(
    clipBehavior: Clip.none,
    children: <Widget>[
      ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(80.0),
          topLeft: Radius.circular(80.0),
        ),
        child: BottomNavigationBar(
          items: bottomnavicatonitem(selectedIndex),
          currentIndex: selectedIndex,
          selectedItemColor: ColorManager.primaryColor,
          unselectedItemColor: ColorManager.headLineColor,
          unselectedLabelStyle:
              const TextStyle(color: ColorManager.headLineColor),
          selectedLabelStyle: const TextStyle(color: ColorManager.primaryColor),
          onTap: onItemTapped,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
        ),
      ),
      Positioned(
        top: -30,
        left: (screenWidth / 2) - 30,
        child: GestureDetector(
          onTap: () => onItemTapped(2),
          child: Column(
            children: [
              CustomPaint(
                size: Size(60, 60),
                painter: HexagonPainter(selected: selectedIndex == 2),
                child: Container(
                  width: 60,
                  height: 60,
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.account_balance_wallet,
                    color: ColorManager.whiteColor,
                    size: 30,
                  ),
                ),
              ),
              Text(
                'Wallet',
                style: TextStyle(
                  color: selectedIndex == 2
                      ? ColorManager.primaryColor
                      : ColorManager.headLineColor,
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}

List<BottomNavigationBarItem> bottomnavicatonitem(int selectedIndex) {
  return <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(
        Icons.home_outlined,
        color: selectedIndex == 0
            ? ColorManager.primaryColor
            : ColorManager.headLineColor,
      ),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.favorite_border,
        color: selectedIndex == 1
            ? ColorManager.primaryColor
            : ColorManager.headLineColor,
      ),
      label: 'Favorites',
    ),
    BottomNavigationBarItem(
      icon: Container(),
      label: '',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.local_offer_outlined,
        color: selectedIndex == 3
            ? ColorManager.primaryColor
            : ColorManager.headLineColor,
      ),
      label: 'Offer',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.person_2_outlined,
        color: selectedIndex == 4
            ? ColorManager.primaryColor
            : ColorManager.headLineColor,
      ),
      label: 'Profile',
    ),
  ];
}
