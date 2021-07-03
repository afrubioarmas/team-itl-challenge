import 'package:flutter/material.dart';
import 'package:team_intl_challenge/controller/authentication/login_controller.dart';
import 'package:team_intl_challenge/misc/app_response.dart';
import 'package:team_intl_challenge/misc/service_locator.dart';
import 'package:team_intl_challenge/navigators/app_navigator/app_navigator.dart';

class AuthenticationScreenPresenter extends ChangeNotifier {
  TextEditingController _emailTC = TextEditingController();
  TextEditingController get emailTc => _emailTC;
  TextEditingController _passwordTC = TextEditingController();
  TextEditingController get passwordTc => _passwordTC;
  AppNavigator appNavigator = locator<AppNavigator>();

  String _error;
  String get error => _error;

  bool _loading = false;
  bool get loading => _loading;

  Future<void> onLoginPressed() async {
    _loading = true;
    notifyListeners();

    LoginController controller =
        LoginController(email: _emailTC.text, password: _passwordTC.text);
    AppResponse<String> loginResponse = await controller.process();
    if (loginResponse.isSuccess()) {
      appNavigator.toHome();
    } else {
      _error = loginResponse.payload;
    }
    _loading = false;
    notifyListeners();
  }
}
