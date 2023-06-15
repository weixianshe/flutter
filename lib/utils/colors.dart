import 'package:flutter/material.dart';

class FormatColor {
  static Color hexToColor(String hexColor) {
    String hex = hexColor.replaceAll("#", "");
    if (hex.length == 6) {
      hex = "FF" + hex;
    }
    int colorValue = int.parse(hex, radix: 16);
    return Color(colorValue);
  }
}
