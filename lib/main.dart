// import 'package:firebase_auth/firebase_auth.dart';
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:ride_application/injection_file.dart';
import 'config/bloc_observe_config.dart';
import 'core/resources/routes/app_routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  // FirebaseAuth.instance.authStateChanges().listen((User? user) {
  //   if (user == null) {
  //     print('User is currently signed out!');
  //   } else {
  //     print('User is signed in!');
  //   }
  // });

  await Hive.initFlutter();
  Bloc.observer = MyBlocObserver();
  await Hive.openBox('projectBox');

  runApp(const MyApp());
}

late double screenWidth;
late double padding = 8.0;

late double screenHeight;
late Orientation orientation;
late bool isPortrait;
late bool isMobile;
late bool isIos;

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.sizeOf(context).width;
    screenHeight = MediaQuery.sizeOf(context).height;
    orientation = MediaQuery.orientationOf(context);
    padding = screenHeight * 0.02;
    isPortrait = orientation == Orientation.portrait;
    isMobile = screenWidth < 600;
    isIos = Theme.of(context).platform == TargetPlatform.iOS;

    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRoutes.onGenerateRoutes,
    );
  }
}
