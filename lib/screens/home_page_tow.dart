import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trendy_whatsapp_stickers/Widgets/drawer.dart';
import 'package:trendy_whatsapp_stickers/utils/theme.dart';

class HomePageTow extends StatefulWidget {
  @override
  _HomePageTowState createState() => _HomePageTowState();
}

class _HomePageTowState extends State<HomePageTow> {

  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: CustomDrawer.buildDrawer(context),
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30.0), bottomRight: Radius.circular(30.0))
        ),
        child: SafeArea(
          child: Row(
            children: <Widget>[
              InkWell(
                onTap: () => scaffoldKey.currentState.openDrawer(),
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: SvgPicture.asset(
                    'assets/icons/burger_menu.svg',
                    color: MyColors.third,
                    height: 20.0,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  '500+ Arabic Stickers',
                  style: MyTextStyles.bigTitle,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                width: 50.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
