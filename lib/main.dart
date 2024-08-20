import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:ride_application/injection_file.dart';
import 'config/bloc_observe_config.dart';
import 'core/resources/routes/app_routes.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
   await initializeDependencies();

  await Hive.initFlutter();
    Bloc.observer = MyBlocObserver();
  await Hive.openBox('projectBox');

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
    orientation = MediaQuery.orientationOf(context);
    isPortrait = orientation == Orientation.portrait;
    isMobile = screenWidth < 600;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       onGenerateRoute: AppRoutes.onGenerateRoutes,
    );
  }
}
