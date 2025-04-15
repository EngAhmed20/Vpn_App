
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vpn_basic_project/feature/home/presentation/view/home_screen.dart';

import 'core/appPref/app_preference.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppPreference.initHive();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: AppPreference.isDarkMode?ThemeMode.dark:ThemeMode.light,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          centerTitle: true,
          elevation: 3,

        ),

      ),
      darkTheme: ThemeData(
          brightness: Brightness.dark,
          appBarTheme: AppBarTheme(
            centerTitle: true,
            elevation: 3,
          ),

      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
extension AppTheme on ThemeData{
  Color get lightTextColor=>AppPreference.isDarkMode?Colors.white70:Colors.black54;
  Color get buttonNavColor=>AppPreference.isDarkMode?Colors.white12:Colors.redAccent;
  Color get bottomVanColor=>AppPreference.isDarkMode?Colors.white:Colors.black;
  Color get cardColor=>Colors.white;




}