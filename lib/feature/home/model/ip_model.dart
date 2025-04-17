class IpModel {
  final String country;
  final String regionName;
  final String city;
  final String zip;
  final String timezone;
  final String isp;
  final String query;

  IpModel({
    required this.country,
    required this.regionName,
    required this.city,
    required this.zip,
    required this.timezone,
    required this.isp,
    required this.query,
  });

  factory IpModel.fromJson(Map<String, dynamic> json) {
    return IpModel(
      country: json['country'] ?? '',
      regionName: json['regionName'] ?? '',
      city: json['city'] ?? '',
      zip: json['zip'] ?? '',
      timezone: json['timezone'] ?? 'UnKnown',
      isp: json['isp'] ?? 'UnKnown',
      query: json['query'] ?? 'Not available',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'country': country,
      'regionName': regionName,
      'city': city,
      'zip': zip,
      'timezone': timezone,
      'isp': isp,
      'query': query,
    };
  }
}
