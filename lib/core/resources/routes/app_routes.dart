import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:ride_application/features/Auth/presentation/view/news_view.dart';

import '../../../features/Auth/data/model/article_model.dart';
import '../../../features/Auth/presentation/view/sign_up_screen.dart';
import '../../../features/Auth/presentation/view/set_password_screen.dart';
import '../../../features/Auth/presentation/view/welcome_screen.dart';
import '../../../features/on_boarding_screen/screens.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
         var box = Hive.box('projectBox');
        String? token = box.get('token');

        if (token != null) {
return      _materialRoute(WelcomeView()); 
        } else {
          return  _materialRoute( WelcomeView()); 
        }
    

      case '/WelcomeView':
    //    return _materialRoute(WelcomeView(article: settings.arguments as ArticleEntity));
     return _materialRoute(WelcomeView());

      case '/SignUp':
        return _materialRoute(SignUpScreen());
        

case '/RegisterScreen':

        return _materialRoute(RegisterScreen(user: settings.arguments as UserModel));
 


      default:
        return _materialRoute( WelcomeView());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}