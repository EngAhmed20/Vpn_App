class VpnModel {
  final String HostName;
  final int IP;
  final int Ping;
  final int Speed;
  final String CountryLong;
  final String CountryShort;
  final int NumVpnSessions;
  final String OpenVPN_ConfigData_Base64;

  VpnModel({
    required this.HostName,
    required this.IP,
    required this.Ping,
    required this.Speed,
    required this.CountryLong,
    required this.CountryShort,
    required this.NumVpnSessions,
    required this.OpenVPN_ConfigData_Base64,
  });

  factory VpnModel.fromJson(Map<String, dynamic> json) {
    return VpnModel(
      HostName: json['HostName'] ?? '',
      IP: json['IP'] ?? 0,
      Ping: json['Ping'] ?? 0,
      Speed: json['Speed'] ?? 0,
      CountryLong: json['CountryLong'] ?? '',
      CountryShort: json['CountryShort'] ?? '',
      NumVpnSessions: json['NumVpnSessions'] ?? 0,
      OpenVPN_ConfigData_Base64: json['OpenVPN_ConfigData_Base64'] ?? '',
    );
  }

   toJson() {
    return {
      'HostName': HostName,
      'IP': IP,
      'Ping': Ping,
      'Speed': Speed,
      'CountryLong': CountryLong,
      'CountryShort': CountryShort,
      'NumVpnSessions': NumVpnSessions,
      'OpenVPN_ConfigData_Base64': OpenVPN_ConfigData_Base64,
    };
  }
}




