import 'package:flutter/material.dart';

class AppConst {
  static const darkMode = 'darkMode';
  static const lightMode = 'lightMode';
  static const hiveBox = 'data';
  static Size getSize(BuildContext context) {
    return MediaQuery.sizeOf(context);
    // أو: return MediaQuery.of(context).size;
  }
}

