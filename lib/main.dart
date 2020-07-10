import 'package:flutter/material.dart';
import 'package:trendy_whatsapp_stickers/screens/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final String title = 'Trendy WhatsApp Stickers';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(
        primaryColor: Colors.teal[900],
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}
