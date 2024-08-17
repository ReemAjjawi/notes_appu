import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
<<<<<<< HEAD
import 'package:ride_application/features/auth/presentation/view/welcome_screen.dart';

import '../../../features/Auth/presentation/view/set_password_screen.dart';
import '../../../features/Auth/presentation/view/sign_up_screen.dart';
import '../../../features/Settings/presentation/view/change_language.dart';
import '../../../features/Settings/presentation/view/change_password.dart';
import '../../../features/Settings/presentation/view/contact_us.dart';
import '../../../features/Settings/presentation/view/delete_account.dart';
import '../../../features/Settings/presentation/view/privacy_policy.dart';
import '../../../features/Settings/presentation/view/settings.dart';
import '../../../features/auth/data/model/user_model.dart';
=======
import '../../../features/authation/data/model/user_model.dart';
import '../../../features/authation/presentation/view/login_screen.dart';
import '../../../features/authation/presentation/view/set_password_screen.dart';
import '../../../features/authation/presentation/view/sign_up_screen.dart';
import '../../../features/authation/presentation/view/welcome_screen.dart';
>>>>>>> c28ce41f0cfa9449aea5e272968d92b53aa98476
import '../../../features/categories/presentation/view/bicycles_screen.dart';
import '../../../features/categories/presentation/view/categories_screen.dart';
import '../../../features/hub_content/presentation/view/bicycle_details_screen.dart';
import '../../../features/hub_content/presentation/view/bicycle_from_categorey.dart';
import '../../../features/map/presentation/view/home_screen.dart';
import '../../../features/map/presentation/view/location_screen.dart';
import '../../../features/map/presentation/view/map_screen.dart';
import '../../../features/request_rent/presentation/view/Reservation1_screen.dart';
import '../../../features/request_rent/presentation/view/Reservation_screen.dart';
import '../../../features/thank_you/thank_you_screen.dart';

<<<<<<< HEAD



=======
>>>>>>> c28ce41f0cfa9449aea5e272968d92b53aa98476
class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        var box = Hive.box('projectBox');
        String? token = box.get('token');

        if (token != null) {
          return _materialRoute(WelcomeScreen());
        } else {
          return _materialRoute(LoginScreen());
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

      case '/ThankYouScreen':
        return _materialRoute(ThankYouScreen());

      case '/LoginScreen':
        return _materialRoute(LoginScreen());

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
      case '/ReservationtowScreen':
        final args = settings.arguments as DetailArguments;
        return _materialRoute(ReservationtowScreen(
            bicycle: args.bicycle, hubId: args.hubId, hubIdto: args.hubIdto));

      default:
        return _materialRoute(WelcomeScreen());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
