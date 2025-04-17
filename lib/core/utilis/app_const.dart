import 'package:flutter/material.dart';

class AppConst {
  static const apiLink='https://www.vpngate.net/api/iphone/';
  static const ipDetailsLink='http://ip-api.com/json/';
  static const darkMode = 'darkMode';
  static const lightMode = 'lightMode';
  static const hiveBox = 'data';
  static Size getSize(BuildContext context) {
    return MediaQuery.sizeOf(context);
    // أو: return MediaQuery.of(context).size;
  }

  static const String startVpnButtonText="Start VPN";
  static const String stopVpnButtonText='Disconnect VPN';
  static const storeVpnModel = 'storeVpnModel';
  static const storeVpnList = 'storeVpnList';
  //vpn engine
  static const startVpn = "start";
  static const stopVpn = "stop";
  static const killSwitchVpn = "kill_switch";
  static const refreshVpn = "refresh";
  static const stageVpn = "stage";
  static const vpnConnectedNow = "connectedd";
  static const vpnDisConnectedNow = "disconnected";
  static const vpnWaitConnectionNow = "wait_connection";
  static const vpnAuthNow = "authenticating";
  static const vpnReConnectNow = "reconnect";
  static const vpnNoConnectionNow = "no_connection";
  static const vpnConnectingNow = "connecting";
  static const vpnWaitPrepareNow = "prepare";
  static const vpnDeniedNow = "denied";
  static const vpnUserName="vpn";
  static const vpnUserPassword="vpn";
  static const bandwidthUnits = ["Bps", "Kbps", "Mbps", "Gbps", "Tbps"];}
