import '../../../../../../../core/model/position.dart';

class RadiologyModel {
  final Position position;
  final String id;

  final String name;
  final List radiologyTypes;
  final String firstDay;
  final String lastDay;
  final String location;
  final String startWorking;
  final String endWorking;
  final String phoneNumber;
  final String photo;

  RadiologyModel({
    required this.location,
    required this.id,
    required this.name,
    required this.radiologyTypes,
    required this.firstDay,
    required this.lastDay,
    required this.position,
    required this.startWorking,
    required this.endWorking,
    required this.phoneNumber,
    required this.photo
  });

  factory RadiologyModel.fromJson(json) {
    return RadiologyModel(
        name: json['name'],
        location: json['country_city']['country'] +
            ", " +
            json['country_city']['city'] +", "+
            json['about_location'],
        position: Position(
          lan: json['location']['coordinates'][1],
          lat: json['location']['coordinates'][0],
        ),
        radiologyTypes: json['radiology_types'].map((e) => e).toList(),
        photo: json['photo'],
        firstDay: json['first_day'],
        lastDay: json['last_day'],
        phoneNumber: json['phone_number'],
        startWorking: json['start_working'],
        endWorking: json['end_working'],
        id: json['_id']);
  }
}
