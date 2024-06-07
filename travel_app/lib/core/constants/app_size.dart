import 'package:flutter/cupertino.dart';

class AppSize {
  static const double baseWidth = 334;
  static const double baseHeight = 502;

  static double widthScale(BuildContext context, double size) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return size * (screenWidth / baseWidth);
  }

  static double heightScale(BuildContext context, double size) {
    final double screenWidth = MediaQuery.of(context).size.height;
    return size * (screenWidth / baseWidth);
  }

  static double textScale(BuildContext context, double size) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return size * (screenWidth / baseWidth);
  }
}
