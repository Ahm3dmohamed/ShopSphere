import 'package:flutter/material.dart';

class SizeConfig {
  static late double screenHeight;
  static late double screenWidth;
  static late double blockSizeHorizontal;
  static late double blochSizeVertical;
  static void init(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    blockSizeHorizontal = screenWidth / 100;
    blochSizeVertical = screenHeight / 100;
  }

  static double width(double percentage) {
    return blockSizeHorizontal * percentage;
  }

  static double height(double percentage) {
    return blochSizeVertical * percentage;
  }
}
