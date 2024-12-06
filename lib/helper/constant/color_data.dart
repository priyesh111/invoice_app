import 'package:flutter/material.dart';

// Color backGroundColor = "#F9FAFC".toColor();
Color backGroundColor = "#FFFFFF".toColor();
Color primaryBackground = Color(0x10a81650);
Color primaryColor = "#A7398B".toColor();
Color blueColor = "#23408F".toColor();
Color intro1Color = "#FFC8CF".toColor();
Color intro2Color = "#E5ECFF".toColor();
Color intro3Color = "#F7FBCD".toColor();
Color dividerColor = "#E5E8F1".toColor();
Color textColor = "#7F889E".toColor();
Color deatilColor = "#D3DFFF".toColor();
Color listColor = "#EEF1F9".toColor();
Color procced = "#E2EAFF".toColor();
Color success = "#04B155".toColor();
Color successBackground = Color(0xFFEEFCF0);
Color confirm = "#1A237E".toColor();
Color completed = "#0085FF".toColor();
Color error = "#FF2323".toColor();
Color errorBackground =  Color(0xFFFFF3F3);
Color pendingBackground =  Colors.redAccent.withOpacity(0.1);
Color dotBorder = "BEC4D3".toColor();
Color errorColor = "EF5350".toColor();
Color boaderColor = "efefef".toColor();
Color shimmerBaseColor = const Color(0xff99CE02).withOpacity(0.1);
Color successHome = Color(0x2DB2FF59);
Color pendingHome = Color(0x4D81D4FA);
Color monthHome = Colors.greenAccent.withOpacity(0.5);
Color weekHome = Color(0x5100bcd5);

extension ColorExtension on String {
  toColor() {
    var hexColor = replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }
}
