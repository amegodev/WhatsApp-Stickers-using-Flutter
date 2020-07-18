import 'package:facebook_audience_network/ad/ad_banner.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_whatsapp_stickers/flutter_whatsapp_stickers.dart';
import 'package:trendy_whatsapp_stickers/Widgets/drawer.dart';
import 'package:trendy_whatsapp_stickers/utils/ads_helper.dart';
import 'package:trendy_whatsapp_stickers/utils/theme.dart';
import 'package:trendy_whatsapp_stickers/utils/utils.dart';

class StickerPackInformation extends StatefulWidget {
  final List stickerPack;

  StickerPackInformation(this.stickerPack);

  @override
  _StickerPackInformationState createState() =>
      _StickerPackInformationState(stickerPack);
}

class _StickerPackInformationState extends State<StickerPackInformation> {
  List stickerPack;
  final WhatsAppStickers _waStickers = WhatsAppStickers();
  AdsHelper ads;

  _StickerPackInformationState(this.stickerPack); //constructor

  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey();

  void _checkInstallationStatuses() async {
    print("Total Stickers : ${stickerPack.length}");
    for (var j = 0; j < stickerPack.length; j++) {
      var tempName = stickerPack[j]['identifier'];
      bool tempInstall =
          await WhatsAppStickers().isStickerPackInstalled(tempName);

      if (tempInstall == true) {
        if (!stickerPack[6].contains(tempName)) {
          setState(() {
            stickerPack[6].add(tempName);
          });
        }
      } else {
        if (stickerPack[6].contains(tempName)) {
          setState(() {
            stickerPack[6].remove(tempName);
          });
        }
      }
    }
  }

  @override
  void initState() {
    super.initState();
    ads = new AdsHelper();
    ads.loadFbInter(AdsHelper.fbInterId_2);
  }

  @override
  void dispose() {
    ads.disposeAllAds();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List totalStickers = stickerPack[4];
    Widget depInstallWidget;
    if (stickerPack[5] == true) {
      depInstallWidget = Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          "Sticker Added",
          style: MyTextStyles.bigTitle.apply(color: MyColors.primary),
        ),
      );
    } else {
      depInstallWidget = Container(
        margin: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            borderRadius: new BorderRadius.circular(15.0),
            color: MyColors.primary,
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                offset: Offset(0.0, 1.0),
                blurRadius: 4.0,
              )
            ]),
        child: FlatButton(
            padding: EdgeInsets.all(18.0),
            shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(15.0),
            ),
            child: Row(
              children: <Widget>[
                SvgPicture.asset(
                  'assets/icons/wtsp.svg',
                  width: 30.0,
                ),
                Expanded(
                  child: new Text(
                    'Add Sticker',
                    style: MyTextStyles.bigTitle,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            onPressed: () async {
              _waStickers.addStickerPack(
                packageName: WhatsAppPackage.Consumer,
                stickerPackIdentifier: stickerPack[0],
                stickerPackName: stickerPack[1],
                listener: (action, result, {error}) => processResponse(
                  action: action,
                  result: result,
                  error: error,
                  successCallback: () async {
                    _checkInstallationStatuses();
                  },
                  context: context,
                ),
              );
              ads.showInter(probablity: 100);
            }),
      );
    }
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: MyColors.secondary,
      endDrawer: CustomDrawer.buildDrawer(context),
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
                  ads.getFbBanner(AdsHelper.fbBannerId_2, BannerSize.STANDARD),
                  Row(
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          ads.showInter(probablity: 60);
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Icon(
                            Icons.arrow_back_ios,
                            size: 20.0,
                            color: MyColors.darklight["light"],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "${stickerPack[1]} Stickers",
                          style: MyTextStyles.bigTitle,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          scaffoldKey.currentState.openEndDrawer();
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
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100.0),
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    color: MyColors.primary,
                    child: Image.asset(
                      "sticker_packs/${stickerPack[0]}/${stickerPack[3]}",
                      width: 60,
                      height: 60,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "${stickerPack[1]}",
                        style: MyTextStyles.bigTitle.apply(
                            color: MyColors.darklight["dark"],
                            fontSizeFactor: 1.5),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "${stickerPack[2]}",
                        style: MyTextStyles.title.apply(
                            color: MyColors.darklight["dark"].withOpacity(0.5), fontSizeFactor: 0.6),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: MyColors.primary,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(0.0, 1.0),
                    blurRadius: 4.0,
                  )
                ],
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: GridView.builder(
                    gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1,
                    ),
                    itemCount: totalStickers.length,
                    itemBuilder: (context, index) {
                      var stickerImg =
                          "sticker_packs/${stickerPack[0]}/${totalStickers[index]['image_file']}";
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0)),
                            child: Image.asset(
                              stickerImg,
                              width: 80,
                              height: 80,
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ),
          ),
          depInstallWidget,
        ],
      ),
    );
  }
}
