class VpnModel {
  final String hostName;
  final int ip;
  final int ping;
  final int speed;
  final String countryLongName;
  final String countryShortName;
  final int vpnSessionNum;
  final String base64OpenVpnConfigurationDate;

  VpnModel({
    required this.hostName,
    required this.ip,
    required this.ping,
    required this.speed,
    required this.countryLongName,
    required this.countryShortName,
    required this.vpnSessionNum,
    required this.base64OpenVpnConfigurationDate,
  });

  factory VpnModel.fromJson(Map<String, dynamic> json) {
    return VpnModel(
      hostName: json['hostName'] ?? '',
      ip: json['ip'] ?? 0,
      ping: json['ping'] ?? 0,
      speed: json['speed'] ?? 0,
      countryLongName: json['countryLongName'] ?? '',
      countryShortName: json['countryShortName'] ?? '',
      vpnSessionNum: json['vpnSessionNum'] ?? 0,
      base64OpenVpnConfigurationDate: json['base64OpenVpnConfigurationDate'] ?? '',
    );
  }

  toJson() {
    return {
      'hostName': hostName,
      'ip': ip,
      'ping': ping,
      'speed': speed,
      'countryLongName': countryLongName,
      'countryShortName': countryShortName,
      'vpnSessionNum': vpnSessionNum,
      'base64OpenVpnConfigurationDate': base64OpenVpnConfigurationDate,
    };
  }
}




