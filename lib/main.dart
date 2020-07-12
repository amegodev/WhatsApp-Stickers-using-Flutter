import 'package:flutter/material.dart';
import 'package:trendy_whatsapp_stickers/screens/home_page.dart';
import 'package:trendy_whatsapp_stickers/screens/home_page_tow.dart';

var routes = <String, WidgetBuilder>{
  "/home" : (BuildContext context) => HomePageTow(),
};

void main() {
  WidgetsFlutterBinding.ensureInitialized();
//  AdsHelper.initFacebookAds();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final String title = '500+ Arabic Stickers';

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
      home: HomePageTow(),
    );
  }
}
