import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:vpn_basic_project/feature/home/model/vpn_configuration.dart';
import 'package:vpn_basic_project/feature/home/model/vpn_status.dart';

class VpnEngine{
  ///native channel
  static final String eventChannelVpnStage="vpnStage"; ///connected or not
  static final String eventChannelVpnStatus="vpnStatus"; /// status
  static final String methodChannelVpnControl="vpnControl";///start stop
/// vpn connection stage snapshot
/// connected or not
static Stream<String> snapShotVpnStage()=>EventChannel(eventChannelVpnStage)
    .receiveBroadcastStream()
    .cast();
/// vpn connection status
static Stream<VpnStatus> snapShotVpnStatus()=>EventChannel(eventChannelVpnStatus)
    .receiveBroadcastStream()
    .map((event)=>VpnStatus.fromJson(jsonDecode(event))).cast();
/// start vpn
static Future<void>startVpnNow(VpnConfiguration vpnConfig)async{

return MethodChannel(methodChannelVpnControl).invokeMethod(
  "start",{
  "config":vpnConfig.config,
  "country":vpnConfig.countryName,
   "username":vpnConfig.userName,
   "password":vpnConfig.password,
  }
);
}
///stop vpn
static Future<void> stopVpnNow(){
  return MethodChannel(methodChannelVpnControl).invokeMethod("stop");
}

  /// when close vpn wifi will  close

static Future<void> killSwitchOpenNow(){
  return MethodChannel(methodChannelVpnControl).invokeMethod("kill_switch");
}
///refresh
  static Future<void> refreshStageNow(){
    return MethodChannel(methodChannelVpnControl).invokeMethod("refresh");
  }
  //? conncect or dis connect
static Future<String?>getStageNow(){
  return MethodChannel(methodChannelVpnControl).invokeMethod("stage");
}
  static Future<bool>isConnectedNow(){
    return getStageNow().then((value)=>value!.toLowerCase()=="connected");
  }
}
