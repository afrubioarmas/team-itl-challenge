import 'package:flutter/material.dart';
import 'package:team_intl_challenge/misc/helpers/random_helper.dart';
import 'package:team_intl_challenge/misc/service_locator.dart';
import 'package:team_intl_challenge/model/factory.dart';
import 'package:team_intl_challenge/navigators/app_navigator/app_navigator.dart';

class HomescreenPresenter extends ChangeNotifier {
  List<Factory> _factories;
  List<Factory> get factories => _factories;

  AppNavigator appNavigator = locator<AppNavigator>();

  void onViewCreated() {
    _factories = locator<List<Factory>>();
    productionCycle();
  }

  Future<void> productionCycle() async {
    while (true) {
      _factories.forEach((element) {
        if (element.active) {
          if (RandomHelper.getRandomInt(100) > element.errorPercentage) {
            element.amount = element.amount + element.capacityPerSecond;
          }
        }
      });
      _factories.sort((a, b) => b.amount.compareTo(a.amount));
      await Future.delayed(Duration(seconds: 1));
      notifyListeners();
    }
  }

  void toggleActive(int index) {
    factories[index].active = !factories[index].active;
    notifyListeners();
  }

  void onRecordPressed(int index) {
    appNavigator.toFactoryDetail(factories[index]);
  }
}
