import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_whatsapp_stickers/flutter_whatsapp_stickers.dart';
import 'package:trendy_whatsapp_stickers/screens/sticker_pack_info.dart';
import 'package:trendy_whatsapp_stickers/utils/theme.dart';
import 'package:trendy_whatsapp_stickers/utils/utils.dart';

class StaticContent extends StatefulWidget {
  @override
  _StaticContentState createState() => _StaticContentState();
}

class _StaticContentState extends State<StaticContent> {
  final WhatsAppStickers _waStickers = WhatsAppStickers();
  List stickerList = new List();
  List installedStickers = new List();

  void _loadStickers() async {
    String data =
        await rootBundle.loadString("sticker_packs/sticker_packs.json");
    final response = json.decode(data);
    List tempList = new List();

    for (int i = 0; i < response['sticker_packs'].length; i++) {
      tempList.add(response['sticker_packs'][i]);
    }
    setState(() {
      stickerList.addAll(tempList);
    });
    _checkInstallationStatuses();
  }

  void _checkInstallationStatuses() async {
    print("Total Stickers : ${stickerList.length}");
    for (var j = 0; j < stickerList.length; j++) {
      var tempName = stickerList[j]['identifier'];
      bool tempInstall =
          await WhatsAppStickers().isStickerPackInstalled(tempName);

      if (tempInstall == true) {
        if (!installedStickers.contains(tempName)) {
          setState(() {
            installedStickers.add(tempName);
          });
        }
      } else {
        if (installedStickers.contains(tempName)) {
          setState(() {
            installedStickers.remove(tempName);
          });
        }
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _loadStickers();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: stickerList.length,
        itemBuilder: (context, index) {
          if (stickerList.length == 0) {
            return Container(
              child: CircularProgressIndicator(),
            );
          } else {
            var stickerId = stickerList[index]['identifier'];
            var stickerName = stickerList[index]['name'];
            var stickerPublisher = stickerList[index]['publisher'];
            var stickerTrayIcon = stickerList[index]['tray_image_file'];
            var tempStickerList = List();

            bool stickerInstalled = false;
            if (installedStickers.contains(stickerId)) {
              stickerInstalled = true;
            } else {
              stickerInstalled = false;
            }
            tempStickerList.add(stickerList[index]['identifier']);
            tempStickerList.add(stickerList[index]['name']);
            tempStickerList.add(stickerList[index]['publisher']);
            tempStickerList.add(stickerList[index]['tray_image_file']);
            tempStickerList.add(stickerList[index]['stickers']);
            tempStickerList.add(stickerInstalled);
            tempStickerList.add(installedStickers);

            return stickerPack(
              tempStickerList,
              stickerName,
              stickerPublisher,
              stickerId,
              stickerTrayIcon,
              stickerInstalled,
            );
          }
        });
  }

  Widget stickerPack(List stickerList, String name, String publisher,
      String identifier, String stickerTrayIcon, bool installed) {
    Widget depInstallWidget;
    if (installed == true) {
      depInstallWidget = IconButton(
        icon: SvgPicture.asset('assets/icons/check.svg', color: MyColors.primary),
        color: Colors.teal,
        tooltip: 'Add Sticker to WhatsApp',
        onPressed: () {},
      );
    } else {
      depInstallWidget = IconButton(
        icon: SvgPicture.asset('assets/icons/add.svg',),
        color: Colors.teal,
        tooltip: 'Add Sticker to WhatsApp',
        onPressed: () async {
          _waStickers.addStickerPack(
            packageName: WhatsAppPackage.Consumer,
            stickerPackIdentifier: identifier,
            stickerPackName: name,
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
        },
      );
    }

    return Container(
      padding: EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                offset: Offset(0.0, 1.0),
                blurRadius: 1.0,
              )
            ]),
        child: ClipRRect(
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) =>
                    StickerPackInformation(stickerList),
              ));
            },
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Container(
                      decoration: BoxDecoration(
                        color: MyColors.darklight["light"],
                        borderRadius: BorderRadius.circular(15.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 2.0
                          )
                        ]
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image.asset("sticker_packs/$identifier/$stickerTrayIcon"),
                    ),
                  ),
                  title: Text(
                    "$name",
                    style: MyTextStyles.title.apply(color: MyColors.darklight["dark"]),
                  ),
                  subtitle: Text(
                    "$publisher",
                    style: MyTextStyles.subTitle
                        .apply(color: MyColors.darklight["dark"].withOpacity(0.5)),
                  ),
                  trailing: Column(
                    children: <Widget>[
                      depInstallWidget,
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                      child: Image.asset("sticker_packs/$identifier/${stickerList[4][1]['image_file']}", height: 50.0,),
                    ),
                    Container(
                      padding: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                      child: Image.asset("sticker_packs/$identifier/${stickerList[4][2]['image_file']}", height: 50.0,),
                    ),
                    Container(
                      padding: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                      child: Image.asset("sticker_packs/$identifier/${stickerList[4][3]['image_file']}", height: 50.0,),
                    ),
                    Container(
                      padding: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                      child: Image.asset("sticker_packs/$identifier/${stickerList[4][4]['image_file']}", height: 50.0,),
                    ),
                    Container(
                      padding: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                      child: Image.asset("sticker_packs/$identifier/${stickerList[4][5]['image_file']}", height: 50.0,),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
