import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:ride_application/features/map/data/model/hub_model.dart';
import '../../../features/Settings/presentation/view/change_language.dart';
import '../../../features/Settings/presentation/view/delete_account.dart';
import '../../../features/Settings/presentation/view/settings.dart';
import '../../../features/favourite/favourite_screen.dart';
import '../../../features/add_money/presentation/view/add_money_to_wallet_screen.dart';
import '../../../features/favourite/favourite_screen.dart';
import '../../../features/get_wallet/presentation/view/get_wallet_info_screen.dart';
import '../../../features/changepassword/presentation/view/change_password.dart';
import '../../../features/policy/presentation/view/contact_us.dart';
import '../../../features/policy/presentation/view/privacy_policy.dart';
import '../../../features/authation/data/model/user_model.dart';
import '../../../features/authation/presentation/view/login_screen.dart';
import '../../../features/authation/presentation/view/set_password_screen.dart';
import '../../../features/authation/presentation/view/sign_up_screen.dart';
import '../../../features/authation/presentation/view/welcome_screen.dart';
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
import '../../../features/wallet/presentation/view/create_wallet_screen.dart';
import '../../../features/wallet/wallet_screen.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        var box = Hive.box('projectBox');
        String? token = box.get('token');
// {latitude: 51.5315, longtitude: 4.4598}
        if (token != null) {
          return _materialRoute(CreateWalletScreen());
        } else {
          return _materialRoute(WelcomeScreen());
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
      case '/DeleteAccountScreen':
        return _materialRoute(DeleteAccountScreen());
      case '/ContactUsScreen':
        return _materialRoute(ContactUsScreen());
      case '/PrivacyPolicyScreen':
        return _materialRoute(PrivacyPolicyScreen());
      case '/ChangePasswordScreen':
        return _materialRoute(ChangePasswordScreen());
      case '/ChangeLanguageScreen':
        return _materialRoute(ChangeLanguageScreen());

      case '/ThankYouScreen':
        return _materialRoute(ThankYouScreen());

      case '/LoginScreen':
        return _materialRoute(LoginScreen());

      case '/CreateWalletScreen':
        return _materialRoute(CreateWalletScreen());

      case '/AddMoneyScreen':
        return _materialRoute(
            AddMoneyScreen(code: settings.arguments as String));

      // case '/WalletCodes':
      //   return _materialRoute(WalletScreen());

      case '/WalletScreen':
        return _materialRoute(WalletScreen());

      case '/CategoriesScreen':
        return _materialRoute(const CategoriesScreen());

      case '/SettingsScreen':
        return _materialRoute(SettingsScreen());
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
