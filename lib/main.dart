import 'package:flutter/widgets.dart';

import 'app.dart';
import 'misc/service_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await locator.registerDependencies();
  runApp(App());
}
