import 'package:shared_preferences/shared_preferences.dart';
import 'package:skynet/core/services/service_locator.dart';

class SharedPreferencesRepository {
  SharedPreferences get prefs => locator<SharedPreferences>();
}
