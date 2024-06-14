import 'package:url_launcher/url_launcher.dart';

abstract class OpenDialer {
  static launchCaller({required String urlL}) async {
    Uri url = Uri(scheme: "tel", path: urlL);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
