import 'package:flutter/material.dart';
import 'lanscape_layout.dart';
import 'portarait_layout.dart';

class MobileLayout extends StatelessWidget {
  const MobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        if (orientation == Orientation.portrait) {
          return const PortraitLayout();
        } else {
          return const LandscapeLayout();
        }
      },
    );
  }
}
