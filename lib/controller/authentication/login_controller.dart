import 'package:team_intl_challenge/misc/app_response.dart';
import 'package:team_intl_challenge/misc/helpers/logged_user_helper.dart';
import 'package:team_intl_challenge/model/user.dart';

import '../controller.dart';

class LoginController extends Controller {
  String email;
  String password;

  LoginController({this.email, this.password});

  @override
  Future<AppResponse<String>> process() async {
    await Future.delayed(Duration(seconds: 1));
    if (email == "admin@team.com" && password == "team2021") {
      LoggedUserHelper.setLoggedUser(User(name: "Admin", email: email));
      return AppResponse.success();
    } else {
      return AppResponse.failure(
          errorCode: ErrorCode.LOGIN_FAILED, payload: "Login error");
    }
  }
}
