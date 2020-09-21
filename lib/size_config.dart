import 'package:flutter/cupertino.dart';

class SizeConfig {
  static double screenWidth;
  static double screenHeight;
  static Orientation orientation;

  static void init(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    orientation = mediaQueryData.orientation;
    screenWidth = mediaQueryData.size.width;
    screenHeight = mediaQueryData.size.height;

    /*if (orientation == Orientation.portrait) {
      screenWidth = mediaQueryData.size.width;
      screenHeight = mediaQueryData.size.height;
    } else {
      screenWidth = mediaQueryData.size.height;
      screenHeight = mediaQueryData.size.width;
    }*/

  }
}
