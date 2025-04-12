import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vpn_basic_project/core/appPref/app_preference.dart';
import 'package:vpn_basic_project/core/utilis/app_style/app_text_styles.dart';
import 'package:vpn_basic_project/feature/home/presentation/view/widget/bottom_nav_bar.dart';
import 'package:vpn_basic_project/feature/home/presentation/view/widget/custom_rounded_button.dart';
import 'package:vpn_basic_project/feature/home/presentation/view/widget/vpn_rounded_button.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: Semantics(button: true, child: bottomNavBar(context)),
      ),
      appBar: AppBar(
        title: Text(
          'Free Vpn',
          style: textStyle.Bold28,
        ),
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.perm_device_info,
              size: 30,
            )),
        actions: [
          IconButton(
              onPressed: () {
                AppPreference.isDarkMode = !AppPreference.isDarkMode;
                Get.changeThemeMode(
                  AppPreference.isDarkMode ? ThemeMode.dark : ThemeMode.light,
                );
                setState(() {});
              },
              icon: AppPreference.isDarkMode
                  ? Icon(
                      Icons.sunny,
                      size: 30,
                    )
                  : Icon(
                      Icons.brightness_2_outlined,
                      size: 30,
                    ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomRoundedButton(
                  title: 'Location',
                  subTitle: 'Free',
                  icon: Icons.flag_circle_rounded,
                  backgroundColor: Color(0xFF2ECC71),
                ),
                CustomRoundedButton(
                  title: '60 ms',
                  subTitle: 'Ping',
                  icon: Icons.graphic_eq_outlined,
                  backgroundColor: Color(0xFFBDC3C7),
                ),
              ],
            ),
            VpnRoundedButton(onTap: (){},),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomRoundedButton(
                  title: '0 kbps',
                  subTitle: 'Download',
                  icon: Icons.download_outlined,
                  backgroundColor: Color(0xFF4A90E2),
                ),
                CustomRoundedButton(
                  title: '0 kbps',
                  subTitle: 'Upload',
                  icon: Icons.upload_outlined,
                  backgroundColor: Color(0xFF8E44AD),
                ),
              ],
            ),

          ],
        ),

      ),
    );
  }
}
