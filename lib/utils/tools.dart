
import 'package:package_info/package_info.dart';
import 'package:url_launcher/url_launcher.dart';

class Tools {
  static PackageInfo packageInfo = PackageInfo(
    appName: ' ',
    packageName: ' ',
    version: ' ',
    buildNumber: ' ',
  );

  static Future<void> getAppInfo() async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    packageInfo = info;
  }

  static launchURLRate() async {
    var url = 'https://play.google.com/store/apps/details?id=' +
        Tools.packageInfo.packageName;
    if (await canLaunch(url)) {
      await launch(url);
      print('visiting : $url');
    } else {
      throw 'Could not launch $url';
    }
  }

  static launchURLMore() async {
    var url = 'https://play.google.com/store/apps/dev?id=6782303090044555721';
    if (await canLaunch(url)) {
      await launch(url);
      print('visiting : $url');
    } else {
      throw 'Could not launch $url';
    }
  }

  static launchURLPrivacy() async {
    var url = 'https://amegodev.github.io/Apps_Privacy/arabic_stickers_privacy_policy.html';
    if (await canLaunch(url)) {
      await launch(url);
      print('visiting : $url');
    } else {
      throw 'Could not launch $url';
    }
  }
}
