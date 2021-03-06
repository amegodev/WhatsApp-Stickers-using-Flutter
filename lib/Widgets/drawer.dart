import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trendy_whatsapp_stickers/utils/navigator.dart';
import 'package:trendy_whatsapp_stickers/utils/strings.dart';
import 'package:trendy_whatsapp_stickers/utils/theme.dart';
import 'package:trendy_whatsapp_stickers/utils/tools.dart';


class CustomDrawer{
  static Drawer buildDrawer(BuildContext context) {
    return Drawer(
      child: Container(
        color: MyColors.primary,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Image.asset(
                        'assets/icon.png',
                        width: 100.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Tools.packageInfo == null
                        ? SizedBox()
                        : Padding(
                      padding: const EdgeInsets.only(bottom: 20.0, top: 20.0),
                      child: Text(
                        Tools.packageInfo.appName,
                        style: MyTextStyles.bigTitle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
                      child: FlatButton(
                        padding: EdgeInsets.all(10.0),
                        color: Theme.of(context).accentColor.withOpacity(0.1),
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(100.0),
                        ),
                        onPressed: () {
                          MyNavigator.goHome(context);
                        },
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              width: 10.0,
                            ),
                            SvgPicture.asset(
                              'assets/icons/home.svg',
                              width: 30.0,
                            ),
                            SizedBox(
                              width: 30.0,
                            ),
                            Text(
                              Strings.home,
                              style: MyTextStyles.title,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, bottom: 8.0, right: 8.0),
                      child: FlatButton(
                        padding: EdgeInsets.all(10.0),
                        color: Theme.of(context).accentColor.withOpacity(0.1),
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(100.0),
                        ),
                        onPressed: () {
                          Tools.launchURLRate();
                        },
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              width: 10.0,
                            ),
                            SvgPicture.asset(
                              'assets/icons/rate.svg',
                              width: 30.0,
                            ),
                            SizedBox(
                              width: 30.0,
                            ),
                            Text(
                              Strings.rate,
                              style: MyTextStyles.title,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, bottom: 8.0, right: 8.0),
                      child: FlatButton(
                        padding: EdgeInsets.all(10.0),
                        color: Theme.of(context).accentColor.withOpacity(0.1),
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(100.0),
                        ),
                        onPressed: () {
                          Tools.launchURLMore();
                        },
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              width: 10.0,
                            ),
                            SvgPicture.asset(
                              'assets/icons/more.svg',
                              width: 30.0,
                            ),
                            SizedBox(
                              width: 30.0,
                            ),
                            Text(
                              Strings.more,
                              style: MyTextStyles.title,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, bottom: 8.0, right: 8.0),
                      child: FlatButton(
                        padding: EdgeInsets.all(10.0),
                        color: Theme.of(context).accentColor.withOpacity(0.1),
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(100.0),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                          Tools.launchURLPrivacy();
                        },
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              width: 10.0,
                            ),
                            SvgPicture.asset(
                              'assets/icons/privacy_policy.svg',
                              width: 30.0,
                            ),
                            SizedBox(
                              width: 30.0,
                            ),
                            Text(
                              Strings.privacy,
                              style: MyTextStyles.title,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  'Version ' + Tools.packageInfo.version,
                  style: MyTextStyles.subTitle.apply(fontSizeFactor: 0.8),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Text(
                  'Build number ' + Tools.packageInfo.buildNumber,
                  style: MyTextStyles.subTitle.apply(fontSizeFactor: 0.8),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}