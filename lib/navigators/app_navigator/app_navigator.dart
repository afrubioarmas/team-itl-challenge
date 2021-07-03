import 'package:flutter/material.dart';
import 'package:team_intl_challenge/model/factory.dart';
import 'package:team_intl_challenge/view/screens/authentication_screen/authentication_screen.dart';
import 'package:team_intl_challenge/view/screens/factory_creation_screen/factory_creation_screen.dart';
import 'package:team_intl_challenge/view/screens/factory_creation_screen/factory_detail_screen.dart';
import 'package:team_intl_challenge/view/screens/homescreen/homescreen.dart';

import 'app_routes.dart';

class AppNavigator {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<void> toHome() {
    return _pushRoute(AppRoutes.home, clearStack: true);
  }

  Future<void> toAuthentication() {
    return _pushRoute(AppRoutes.authentication, clearStack: true);
  }

  Future<void> toFactoryCreation() {
    return _pushRoute(AppRoutes.factoryCreation);
  }

  Future<void> toFactoryDetail(Factory factory) {
    return _pushRoute(AppRoutes.factoryDetail, arguments: factory);
  }

  popScreen() {
    navigatorKey.currentState.pop();
  }

  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(builder: (context) => Homescreen());

      case AppRoutes.authentication:
        return MaterialPageRoute(builder: (context) => AuthenticationScreen());

      case AppRoutes.factoryCreation:
        return MaterialPageRoute(builder: (context) => FactoryCreationScreen());

      case AppRoutes.factoryDetail:
        return MaterialPageRoute(
            builder: (context) => FactoryDetailScreen(settings.arguments));
    }
    return null;
  }

  Future<T> _pushRoute<T>(String routeName,
      {Object arguments, bool clearStack = false}) {
    if (clearStack) {
      return navigatorKey.currentState.pushNamedAndRemoveUntil<T>(
          routeName, (route) => false,
          arguments: arguments);
    } else {
      return navigatorKey.currentState
          .pushNamed<T>(routeName, arguments: arguments);
    }
  }
}
