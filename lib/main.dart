import 'package:flutter/material.dart';
import 'package:ride_application/injection_file.dart';

import 'features/on_boarding_screen/on_borarding_view.dart';
import 'responsive/adaptive_layout.dart';
import 'responsive/desktop_layout.dart';
import 'responsive/mobile_layout.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

late double screenWidth;
late double screenHeight;
late Orientation orientation;
late bool isPortrait;
late bool isMobile;

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
     screenWidth = MediaQuery.sizeOf(context).width;
     screenHeight = MediaQuery.sizeOf(context).height;
     orientation = MediaQuery.of(context).orientation;
  isPortrait = orientation == Orientation.portrait;
isMobile = screenWidth <600 ;
    return  MaterialApp(
    home: HomePage(
     ),
    );
  }
}
