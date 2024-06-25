import 'package:med_dos/core/model/position.dart';

class HealthCenterModel {
  final String name;
  final String description;
  final String location;
  final Position position;

  HealthCenterModel({
    required this.name,
    required this.description,
    required this.location,
    required this.position,
  });

  factory HealthCenterModel.fromJson(json) {
    Position p=Position(lat: json['lat'], lan: json['lan']);
    return HealthCenterModel(
      name: json['name'],
      description: json['description'],
      location: json['location'],
      position: p,
    );
  }
}
