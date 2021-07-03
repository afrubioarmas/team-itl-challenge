import 'package:team_intl_challenge/model/user.dart';
import '../service_locator.dart';

class LoggedUserHelper {
  static void setLoggedUser(User userToSet) {
    locator<User>().equalizeWith(userToSet);
  }

  static User getLoggedUser() {
    return locator<User>();
  }
}
