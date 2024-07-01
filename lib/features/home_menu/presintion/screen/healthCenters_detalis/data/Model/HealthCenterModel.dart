import 'package:med_dos/core/model/position.dart';

class HealthCenterModel {
  final String name;
  final String location;
  final Position position;
  final phone;
  final List<String> available_devices;

  HealthCenterModel(
      {required this.name,
      required this.location,
      required this.position,
      required this.phone,
      required this.available_devices});

  factory HealthCenterModel.fromJson(json) {
    return HealthCenterModel(
      name: json['name'],
      available_devices: json['available_devices'].map((e) => e).toList(),
      phone: json['phone'],
      location: json['country_city']['country'] +
          ", " +
          json['country_city']['city'] +
          json['about_location'],
      position: Position(
        lan: json['coordinates'][1],
        lat: json['coordinates'][0],
      ),
    );
  }
}
