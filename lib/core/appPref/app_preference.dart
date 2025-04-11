
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:vpn_basic_project/core/utilis/app_const.dart';

class AppPreference{
  static late Box boxOfData;
  static Future<void> initHive()async{
    ///init hive location and directory
    await Hive.initFlutter();
    /// open box
    boxOfData=await Hive.openBox(AppConst.hiveBox);
  }
  /// save dark mood
  static set isDarkMode(bool value)=>boxOfData.put(AppConst.darkMode, value);
  /// get mode
  static bool get isDarkMode=>boxOfData.get(AppConst.darkMode)??false;


}