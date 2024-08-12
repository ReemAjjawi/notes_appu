import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:ride_application/features/auth/presentation/view/welcome_screen.dart';
import 'package:ride_application/features/hub_content/data/model/second_model.dart';
import 'package:ride_application/features/map/data/model/hubinfo_model.dart';
import '../../../features/auth/data/model/user_model.dart';
import '../../../features/auth/presentation/view/sign_up_screen.dart';
import '../../../features/auth/presentation/view/set_password_screen.dart';
import '../../../features/categories/presentation/view/bicycles_screen.dart';
import '../../../features/categories/presentation/view/categories_screen.dart';
import '../../../features/hub_content/presentation/view/bicycle_details_screen.dart';
import '../../../features/hub_content/presentation/view/bicycle_from_categorey.dart';
import '../../../features/map/presentation/view/home_screen.dart';
import '../../../features/map/presentation/view/location_screen.dart';
import '../../../features/map/presentation/view/map_screen.dart';
import '../../../features/request_rent/presentation/view/Reservation_screen.dart';
import '../../../features/request_rent/presentation/view/nn.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        var box = Hive.box('projectBox');
        String? token = box.get('token');

        if (token != null) {
          return _materialRoute(WelcomeScreen());
        } else {
          return _materialRoute(WelcomeScreen()
              //   ReservationScreen(
              //   bicycle: BicycleListModel(
              //       id: 0,
              //       modelPrice: ModelPriceModel(id: 0, price: 0, model: "d"),
              //       type: "d",
              //       size: 2,
              //       note: "D",
              //       maintenance: ['d'],
              //       extension: ['d'],
              //       photoId: 0,
              //       hasOffer: "d",
              //       discountPrice: 5),
              //   hubId: HubinfoModel(
              //       latitude: 0,
              //       longitude: 0,
              //       id: 0,
              //       name: "ddd",
              //       description: "ddd"),
              //   hubIdto: HubinfoModel(
              //       latitude: 0,
              //       longitude: 0,
              //       id: 0,
              //       name: "ddd",
              //       description: "description"),
              // )
              );
        }
      case '/BicyclesScreen':
        return _materialRoute(
          BicyclesScreen(categoryName: settings.arguments as String),
        );

      case '/BicycleDetailsScreen':
        final args = settings.arguments as DetailArguments;
        return _materialRoute(BicycleDetailsScreen(
            bicycle: args.bicycle, hubId: args.hubId, hubIdto: args.hubIdto));

      case '/BicyclesFromCategorey':
        final args = settings.arguments as CategoryArguments;
        return _materialRoute(BicyclesFromCategorey(
            categoryName: args.categoryName,
            hubId: args.hubId,
            hubIdto: args.hubIdto));

      case '/WelcomeView':
        //    return _materialRoute(WelcomeView(article: settings.arguments as ArticleEntity));
        return _materialRoute(WelcomeScreen());

      case '/SignUp':
        return _materialRoute(SignUpScreen());

      case '/CategoriesScreen':
        return _materialRoute(CategoriesScreen());

      case '/RegisterScreen':
        return _materialRoute(
            RegisterScreen(user: settings.arguments as UserModel));

      case '/HomeScreen':
        final args = settings.arguments as HomeScreenArguments;
        return _materialRoute(HomeScreen(
          hub: args.hub,
          categoryName: args.categoryName,
        ));
      case '/LocationScreen':
        return _materialRoute(LocationScreen(
          categoryName: settings.arguments as String,
        ));
      case '/ReservationScreen':
        final args = settings.arguments as DetailArguments;
        return _materialRoute(ReservationScreen(
            bicycle: args.bicycle, hubId: args.hubId, hubIdto: args.hubIdto));

      default:
        return _materialRoute(WelcomeScreen());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
