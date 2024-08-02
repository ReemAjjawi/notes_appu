import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:ride_application/features/Auth/presentation/view/news_view.dart';
import 'package:ride_application/features/Auth/presentation/view/register.dart';
import 'package:ride_application/features/Auth/presentation/view/set_password_view.dart';
import 'package:ride_application/features/Auth/presentation/view/welcome_view.dart';
import 'package:ride_application/features/on_boarding_screen/screens.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        var box = Hive.box('projectBox');
        String? token = box.get('token');

        if (token != null) {
          return WelcomeView();
        } else {
          return HomePage();
        }
      },
      routes: [
        GoRoute(
          path: 'WelcomeView',
          builder: (context, state) {
            return WelcomeView();
          },
          routes: [
            GoRoute(
              path: 'Sin_up',
              builder: (context, state) {
                return Sin_up();
              },
              routes: [
                GoRoute(
                  path: 'SetPasswordView',
                  builder: (context, state) {
                    return SetPasswordView();
                  },
                  routes: [
                    GoRoute(
                      path: 'Register',
                      builder: (context, state) {
                        return Register();
                      },
                      // routes: [
                      //   GoRoute(
                      //     path: 'viweproject',
                      //     builder: (context, state) {
                      //       return viweproject();
                      //     },
                      //   ),
                      // ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        // GoRoute(
        //   path: 'login',
        //   builder: (BuildContext context, GoRouterState state) {
        //     return LoginPage();
        //   },
        // ),
        // GoRoute(
        //   path: 'register',
        //   builder: (BuildContext context, GoRouterState state) {
        //     return RegisterPage();
        //   },
        // ),
      ],
    ),
  ],
);
