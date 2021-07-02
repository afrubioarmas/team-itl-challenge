import 'package:flutter/material.dart';

import 'primary_routes.dart';

class PrimaryNavigator {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<void> toPrimary() {
    return _pushRoute(PrimaryRoutes.primary, clearStack: true);
  }

  popScreen() {
    navigatorKey.currentState.pop();
  }

  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PrimaryRoutes.primary:
        return MaterialPageRoute(builder: (context) => Text("primary!"));
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
