import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:vpn_basic_project/feature/home/model/vpn_configuration.dart';
import 'package:vpn_basic_project/feature/home/model/vpn_status.dart';

class VpnEngine {
  // Event channel name to listen to VPN connection stage changes (e.g., connected/disconnected)
  static final String eventChannelVpnStage = "vpnStage";

  // Event channel name to listen to real-time VPN status updates (speed, duration, etc.)
  static final String eventChannelVpnStatus = "vpnStatus";

  // Method channel name to control the VPN (start, stop, kill switch, etc.)
  static final String methodChannelVpnControl = "vpnControl";

  // Returns a stream that emits the VPN connection stage as a string (e.g., "connected")
  static Stream<String> snapShotVpnStage() => EventChannel(eventChannelVpnStage)
      .receiveBroadcastStream()
      .cast<String>();

  // Returns a stream that emits VPN status updates as VpnStatus objects
  static Stream<VpnStatus> snapShotVpnStatus() => EventChannel(eventChannelVpnStatus)
      .receiveBroadcastStream()
      .map((event) => VpnStatus.fromJson(jsonDecode(event)))
      .cast<VpnStatus>();

  // Starts the VPN connection using the provided configuration
  static Future<void> startVpnNow(VpnConfiguration vpnConfig) async {
    return MethodChannel(methodChannelVpnControl).invokeMethod("start", {
      "config": vpnConfig.config,
      "country": vpnConfig.countryName,
      "username": vpnConfig.userName,
      "password": vpnConfig.password,
    });
  }

  // Stops the VPN connection
  static Future<void> stopVpnNow() {
    return MethodChannel(methodChannelVpnControl).invokeMethod("stop");
  }

  // Enables the VPN kill switch (disconnects internet when VPN is off)
  static Future<void> killSwitchOpenNow() {
    return MethodChannel(methodChannelVpnControl).invokeMethod("kill_switch");
  }

  // Requests a manual refresh of the VPN connection stage
  static Future<void> refreshStageNow() {
    return MethodChannel(methodChannelVpnControl).invokeMethod("refresh");
  }

  // Gets the current VPN connection stage as a string
  static Future<String?> getStageNow() {
    return MethodChannel(methodChannelVpnControl).invokeMethod("stage");
  }

  // Checks if the VPN is currently connected
  static Future<bool> isConnectedNow() {
    return getStageNow().then((value) => value!.toLowerCase() == "connected");
  }
}
