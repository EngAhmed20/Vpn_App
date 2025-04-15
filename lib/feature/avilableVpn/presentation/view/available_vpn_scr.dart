import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vpn_basic_project/core/utilis/app_style/app_text_styles.dart';
import 'package:vpn_basic_project/feature/avilableVpn/presentation/manager/vpn_location_controller.dart';
import 'package:vpn_basic_project/feature/avilableVpn/presentation/view/widgets/loading_widget.dart';
import 'package:vpn_basic_project/feature/avilableVpn/presentation/view/widgets/no_vpn_founded_widget.dart';
import 'package:vpn_basic_project/feature/avilableVpn/presentation/view/widgets/vpn_avilable_widget.dart';

class AvailableVpnScr extends StatelessWidget {
   AvailableVpnScr({super.key});
final vpnLocationController =VpnLocationController();
  @override
  Widget build(BuildContext context) {
  /*  if(vpnLocationController.vpnFreeServerAvailableList.isEmpty)
      {
        vpnLocationController.retrieveVpnInfo();
      }*/
   /* return Obx(()=>Scaffold(
      appBar: AppBar(
        title: Text("VPN Location(${vpnLocationController.vpnFreeServerAvailableList.length})"
        ,style: textStyle.Bold28,
        ),
      ),
      body: vpnLocationController.isLoadingNewLocation.value?buildLoadingUiWidget()
      :vpnLocationController.vpnFreeServerAvailableList.isEmpty?
      noVpnFoundedUiWidget():vpnAvailableWidget(),

    ));*/
    return Scaffold(
      appBar: AppBar(),
      body: vpnAvailableWidget(context: context, countryFlag: 'sa', countryName: 'sauid', connectedUser: 2, subTitle: ''),
    );
  }


}
