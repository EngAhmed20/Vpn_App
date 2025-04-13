import 'package:flutter/material.dart';

class AppConst {
  static const darkMode = 'darkMode';
  static const lightMode = 'lightMode';
  static const hiveBox = 'data';
  static Size getSize(BuildContext context) {
    return MediaQuery.sizeOf(context);
    // أو: return MediaQuery.of(context).size;
  }

  static const storeVpnModel = 'storeVpnModel';
  static const storeVpnList = 'storeVpnList';
  //vpn engine
  static const startVpn = "start";
  static const stopVpn = "stop";
  static const killSwitchVpn = "kill_switch";
  static const refreshVpn = "refresh";
  static const stageVpn = "stage";
  static const vpnConnectedNow = "connected";
  static const vpnDisConnectedNow = "disconnected";
  static const vpnWaitConnectionNow = "wait_connection";
  static const vpnAuthNow = "authenticating";
  static const vpnReConnectNow = "reconnect";
  static const vpnNoConnectionNow = "no_connection";
  static const vpnConnectingNow = "connecting";
  static const vpnWaitPrepareNow = "prepare";
  static const vpnDeniedNow = "denied";
}
