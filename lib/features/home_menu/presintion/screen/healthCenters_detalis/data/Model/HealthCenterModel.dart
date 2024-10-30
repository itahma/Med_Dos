import 'package:med_dos/core/model/position.dart';

class HealthCenterModel {
  String id;
  final String name;
  final String location;
  final Position position;
  final phone;
  final String photo;
  final List available_devices;

  HealthCenterModel(
      {required this.name,
        required this.id,
      required this.location,
      required this.position,
      required this.phone,
      required this.photo,
      required this.available_devices});

  factory HealthCenterModel.fromJson(json) {
    return HealthCenterModel(
        name: json['name'],
        id: json['_id'],
        available_devices: json['availableDevices'].map((e) => e).toList(),
        phone: json['phone'],
        location: json['country_city']['country'] +
            ", " +
            json['country_city']['city'] +", "+
            json['about_location'],
        position: Position(
          lan: json["location"]['coordinates'][1],
          lat: json["location"]['coordinates'][0],
        ),
        photo: json['photo']);
  }
}
