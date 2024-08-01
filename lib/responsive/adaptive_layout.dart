import 'package:flutter/material.dart';

class AdaptiveLayout extends StatelessWidget {
  const AdaptiveLayout(
      {super.key,
      required this.mobilelayout,
      required this.desktopLayout});
  final Widget mobilelayout;
  final Widget desktopLayout;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600 || constraints.maxHeight < 600) {
          return mobilelayout;
        }  else {
          return desktopLayout;
        }
      },
    );
  }
}
