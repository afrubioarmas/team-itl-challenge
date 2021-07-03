import 'package:flutter/material.dart';
import 'package:team_intl_challenge/misc/service_locator.dart';
import 'package:team_intl_challenge/model/factory.dart';
import 'package:team_intl_challenge/navigators/app_navigator/app_navigator.dart';

class FactoryCreationScreenPresenter extends ChangeNotifier {
  TextEditingController _nameTC = TextEditingController();
  TextEditingController get nameTc => _nameTC;
  TextEditingController _addressTC = TextEditingController();
  TextEditingController get addressTc => _addressTC;
  TextEditingController _capacityTC = TextEditingController();
  TextEditingController get capacityTc => _capacityTC;
  TextEditingController _errorTC = TextEditingController();
  TextEditingController get errorTc => _errorTC;

  String _error;
  String get error => _error;

  bool _loading = false;
  bool get loading => _loading;

  AppNavigator appNavigator = locator<AppNavigator>();

  void onSavePressed() {
    _loading = true;
    _error = "";
    notifyListeners();

    if (_nameTC.text != "" ||
        _addressTC.text != "" ||
        _capacityTC.text != "" ||
        _errorTC.text != "") {
      double error = double.parse(_errorTC.text);
      if (error < 100 && error > 0) {
        Factory toCreate = Factory(
            name: _nameTC.text,
            amount: 0,
            errorPercentage: double.parse(_errorTC.text),
            active: false,
            address: _addressTC.text,
            capacityPerSecond: double.parse(_capacityTC.text));
        locator<List<Factory>>().add(toCreate);
        appNavigator.popScreen();
      } else {
        _error = "Error should be a real percentage.";
      }
    } else {
      _error = "Please fill all fields.";
    }

    _loading = false;
    notifyListeners();
  }
}
