import 'package:facebook_audience_network/ad/ad_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trendy_whatsapp_stickers/Widgets/drawer.dart';
import 'package:trendy_whatsapp_stickers/screens/sticker_list.dart';
import 'package:trendy_whatsapp_stickers/utils/ads_helper.dart';
import 'package:trendy_whatsapp_stickers/utils/theme.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey();
  AdsHelper ads;

  @override
  void initState() {
    super.initState();
    ads = new AdsHelper();
    ads.loadFbInter(AdsHelper.fbInterId_1);
  }

  @override
  void dispose() {
    ads.disposeAllAds();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: CustomDrawer.buildDrawer(context),
      backgroundColor: MyColors.secondary,
      body: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0))),
            child: SafeArea(
              child: Column(
                children: <Widget>[
                  ads.getFbBanner(AdsHelper.fbBannerId_1, BannerSize.STANDARD),
                  Row(
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          scaffoldKey.currentState.openDrawer();
                          ads.showInter(probablity: 40, delay: 5000);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: SvgPicture.asset(
                            'assets/icons/burger_menu.svg',
                            color: MyColors.darklight["light"],
                            height: 20.0,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Hkim Stickes',
                          style: MyTextStyles.bigTitle,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        width: 80.0,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: StaticContent(
              onClicked: () {
                ads.showInter(probablity: 90);
              },
            ),
          ),
        ],
      ),
    );
  }
}
