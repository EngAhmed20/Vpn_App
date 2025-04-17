import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vpn_basic_project/core/appPref/app_preference.dart';
import 'package:vpn_basic_project/core/utilis/app_const.dart';
import 'package:vpn_basic_project/core/vpnEngine/vpn_engine.dart';
import 'package:vpn_basic_project/feature/home/model/vpn_configuration.dart';
import 'package:vpn_basic_project/feature/home/model/vpn_model.dart';

class HomeController extends GetxController{
final Rx<VpnModel> vpnModel=AppPreference.vpnDataModel.obs;
final vpnConnectionState=AppConst.vpnDisConnectedNow.obs;
RxBool isDarkMood=AppPreference.isDarkMode.obs;
Color get RoundedVpnColor{
  switch(vpnConnectionState.value)
  {
    case AppConst.vpnDisConnectedNow:
      return Colors.redAccent;
    case AppConst.vpnConnectedNow:
      return Colors.blue;
    default:
      return Colors.orangeAccent;

  }
}
String get RoundedVpnButtonText{
  switch(vpnConnectionState.value)
  {
    case AppConst.vpnDisConnectedNow:
      return AppConst.startVpnButtonText;
    case AppConst.vpnConnectedNow:
      return AppConst.stopVpnButtonText;
    default:
      return AppConst.vpnConnectingNow;

  }
}
void changeMood(){
  AppPreference.isDarkMode = !AppPreference.isDarkMode;
  isDarkMood.value=!isDarkMood.value;
  Get.changeThemeMode(
      AppPreference.isDarkMode ? ThemeMode.dark : ThemeMode.light,);
}
Icon get iconMood{
  switch(isDarkMood.value)
  {
    case true:
      return  Icon(
  Icons.sunny,
  size: 30,
  );
    case false:
   return Icon(
  Icons.brightness_2_outlined,
  size: 30,
  );

  }
}
Future<void> connectToVpn()async{
  if(vpnModel.value.OpenVPN_ConfigData_Base64.isEmpty){
    Get.snackbar('Country / Location', "Pls select country");
    return ;
  }
  if(vpnConnectionState.value==AppConst.vpnDisConnectedNow){
    print('${vpnConnectionState.value.toString()} 1');
   vpnConnectionState.value=AppConst.vpnConnectingNow;
    print('${vpnConnectionState.value.toString()} 2');
    print(vpnModel.value.OpenVPN_ConfigData_Base64);
    final dataConfigVpn=Base64Decoder().convert(vpnModel.value.OpenVPN_ConfigData_Base64);


    final config=Utf8Decoder().convert(dataConfigVpn);
    final vpnConfig=VpnConfiguration(
        userName: AppConst.vpnUserName,
        password: AppConst.vpnUserPassword,
        countryName: vpnModel.value.CountryLong,
        config: config);
    await VpnEngine.startVpnNow(vpnConfig);
    vpnConnectionState.value=AppConst.vpnConnectedNow;


  }
  else{
    await VpnEngine.stopVpnNow();
    vpnConnectionState.value=AppConst.vpnDisConnectedNow;

  }
}



}

//Rx update ui when change
//obs المراقيه لمعرفه حدوث اس تغيرات