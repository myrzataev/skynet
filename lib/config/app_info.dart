import 'package:package_info_plus/package_info_plus.dart';

class GlobalConfig {
  // static late String appName;
  // static late String packageName;
  static late String version;
  // static late String buildNumber;

  static Future<void> initialize() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    // appName = packageInfo.appName;
    // packageName = packageInfo.packageName;
    version = packageInfo.version;
    // buildNumber = packageInfo.buildNumber;
  }
}
