import 'package:flutter/material.dart';

class HomePageTow extends StatefulWidget {
  @override
  _HomePageTowState createState() => _HomePageTowState();
}

class _HomePageTowState extends State<HomePageTow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('500+ Arabic Stickers', style: TextStyle(
          fontWeight: FontWeight.w700,
        ),),
        centerTitle: true,
      ),
      body: Container(),
    );
  }
}
