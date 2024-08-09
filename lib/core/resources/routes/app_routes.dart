import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:ride_application/features/auth/presentation/view/welcome_screen.dart';
import 'package:ride_application/features/categories/data/model/category_model.dart';
import 'package:ride_application/features/categories/domain/repository/category_repository.dart';
import 'package:ride_application/features/hub_content/data/model/second_model.dart';
import 'package:ride_application/features/map/presenation/map_screen.dart';
import '../../../features/auth/data/model/user_model.dart';
import '../../../features/auth/presentation/view/sign_up_screen.dart';
import '../../../features/auth/presentation/view/set_password_screen.dart';
import '../../../features/categories/presentation/view/bicycles_screen.dart';
import '../../../features/categories/presentation/view/categories_screen.dart';
import '../../../features/hub_content/presentation/view/bicycle_details_screen.dart';
import '../../../features/hub_content/presentation/view/bicycle_from_categorey.dart';
class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
         var box = Hive.box('projectBox');
        String? token = box.get('token');

        if (token != null) {
return      _materialRoute(WelcomeScreen()); 
        } else {
          return  _materialRoute( WelcomeScreen()); 
        }
         case '/BicyclesScreen':
     return _materialRoute(BicyclesScreen(categoryName:settings.arguments as String),);

      case '/map':
     return _materialRoute(Map(categoryName:settings.arguments as String),);
  case '/BicycleDetailsScreen':
     return _materialRoute(BicycleDetailsScreen(bicycle:settings.arguments as BicycleListModel),);


  case '/BicyclesFromCategorey':
  final args = settings.arguments as CategoryArguments;
  return _materialRoute(BicyclesFromCategorey(categoryName: args.categoryName, hubId: args.hubId));


      case '/WelcomeView':
    //    return _materialRoute(WelcomeView(article: settings.arguments as ArticleEntity));
     return _materialRoute(WelcomeScreen());

      case '/SignUp':
        return _materialRoute(SignUpScreen());
        
      case '/CategoriesScreen':
        return _materialRoute(CategoriesScreen());
    

case '/RegisterScreen':

        return _materialRoute(RegisterScreen(user: settings.arguments as UserModel));

      default:
        return _materialRoute( WelcomeScreen());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}