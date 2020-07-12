import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePageTow extends StatefulWidget {
  @override
  _HomePageTowState createState() => _HomePageTowState();
}

class _HomePageTowState extends State<HomePageTow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SvgPicture.asset('assets/icons/burger_menu.svg'),
        title: Text('500+ Arabic Stickers', style: TextStyle(
          fontWeight: FontWeight.w700,
        ),),
        centerTitle: true,
      ),
      body: Container(),
    );
  }
}
