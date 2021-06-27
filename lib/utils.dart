import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils {
  static Future openLink({@required String? url}) => _launchUrl(url);

  static Future _launchUrl(String? url) async {
    if (await canLaunch(url!)) {
      await _launchUrl(url);
    }
  }
}
