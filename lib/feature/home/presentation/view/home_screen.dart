import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vpn_basic_project/core/appPref/app_preference.dart';
import 'package:vpn_basic_project/core/utilis/app_style/app_text_styles.dart';
import 'package:vpn_basic_project/feature/avilableVpn/presentation/view/available_vpn_scr.dart';
import 'package:vpn_basic_project/feature/home/model/vpn_status.dart';
import 'package:vpn_basic_project/feature/home/presentation/manager/home_controller.dart';
import 'package:vpn_basic_project/feature/home/presentation/view/widget/bottom_nav_bar.dart';
import 'package:vpn_basic_project/feature/home/presentation/view/widget/custom_rounded_button.dart';
import 'package:vpn_basic_project/feature/home/presentation/view/widget/vpn_rounded_button.dart';

import '../../../../core/vpnEngine/vpn_engine.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: Semantics(button: true, child: bottomNavBar(context: context,onTap: (){
          Get.to((AvailableVpnScr()));
        })),
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
          Obx(() {
            return IconButton(
              onPressed: () {
                homeController.changeMood(); // تغيير الحالة عند الضغط
              },
              icon: homeController
                  .iconMood, // الأيقونة تتغير بناءً على isDarkMood
            );
          }),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomRoundedButton(
                    title: homeController.vpnModel.value.CountryLong.isEmpty
                        ? 'Location'
                        : homeController.vpnModel.value.CountryLong,
                    subTitle: 'Free',
                    icon: homeController.vpnModel.value.CountryLong.isEmpty
                        ? Icons.flag_circle_rounded
                        : null,
                    backgroundColor: Color(0xFF2ECC71),
                    backgroundImage: homeController
                            .vpnModel.value.CountryLong.isEmpty
                        ? null
                        : AssetImage(
                            "assets/images/countryFlags/${homeController.vpnModel.value.CountryShort}.png"),
                  ),
                  CustomRoundedButton(
                    title: homeController.vpnModel.value.CountryLong.isEmpty
                        ? '0 ms'
                        : '${homeController.vpnModel.value.Ping} ms',
                    subTitle: 'Ping',
                    icon: Icons.graphic_eq_outlined,
                    backgroundColor: Color(0xFFBDC3C7),
                  ),
                ],
              ),
            ),
            Obx(
              () => VpnRoundedButton(
                onTap: () {},
                color: homeController.RoundedVpnColor,
                text: homeController.RoundedVpnButtonText,
              ),
            ),
            StreamBuilder<VpnStatus?>(
                initialData: VpnStatus(),
                stream: VpnEngine.snapShotVpnStatus(),
                builder: (context, data) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomRoundedButton(
                        title: data.data?.byteIn ?? '0 kbps',
                        subTitle: 'Download',
                        icon: Icons.download_outlined,
                        backgroundColor: Color(0xFF4A90E2),
                      ),
                      CustomRoundedButton(
                        title: data.data?.byteOut ?? '0 kbps',
                        subTitle: 'Upload',
                        icon: Icons.upload_outlined,
                        backgroundColor: Color(0xFF8E44AD),
                      ),
                    ],
                  );
                })
          ],
        ),
      ),
    );
  }
}
