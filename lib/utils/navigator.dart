import 'package:flutter/material.dart';
import 'package:trendy_whatsapp_stickers/screens/sticker_pack_info.dart';

class MyNavigator{
  static void goHome(BuildContext context){
    Navigator.pushReplacementNamed(context, "/home");
  }

  static void goStickerInfo(BuildContext context, List stickerPack) {
    Navigator.of(context).push( MaterialPageRoute(
      builder: (BuildContext context) =>StickerPackInformation(stickerPack),
    ));
  }
}