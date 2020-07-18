import 'package:flutter/material.dart';
import 'package:trendy_whatsapp_stickers/screens/home_page.dart';
import 'package:trendy_whatsapp_stickers/utils/ads_helper.dart';
import 'package:trendy_whatsapp_stickers/utils/tools.dart';

var routes = <String, WidgetBuilder>{
  "/home" : (BuildContext context) => HomePage(),
};

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AdsHelper.initFacebookAds();
  Tools.getAppInfo().then((value) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  final String title = 'Hkim Stickes';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(
        primaryColor: Colors.teal[900],
        fontFamily: 'Montserrat'
      ),
      debugShowCheckedModeBanner: false,
      routes: routes,
      home: HomePage(),
    );
  }
}
