import 'package:team_intl_challenge/misc/app_response.dart';

abstract class Controller {
  Future<AppResponse> process();
}
