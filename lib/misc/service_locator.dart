import 'package:get_it/get_it.dart';
import 'package:team_intl_challenge/model/factory.dart';
import 'package:team_intl_challenge/model/user.dart';
import 'package:team_intl_challenge/navigators/app_navigator/app_navigator.dart';

final ServiceLocator locator = ServiceLocator._();

/// Convenience wrapper around GetIt.
class ServiceLocator<T> {
  ServiceLocator._();

  final GetIt _getIt = GetIt.instance;

  T call<T>() => _getIt<T>();

  Future<void> registerDependencies() async {
    //Navigators Start
    _getIt.registerSingleton(AppNavigator());
    //Navigator end

    //For session management
    _getIt.registerSingleton(User());

    _getIt.registerSingleton(List<Factory>());

//    //Repositories begin
//    _getIt.registerSingleton(PokemonRepository());
//    //Repositories end
  }
}
