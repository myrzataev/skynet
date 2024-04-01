import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final locator = GetIt.instance;
Future<void> setupServiceLocator() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  locator.registerSingleton<SharedPreferences>(preferences);
}
