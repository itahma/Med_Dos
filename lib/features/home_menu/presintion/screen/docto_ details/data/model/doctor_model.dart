import 'package:med_dos/core/database/api/end_points.dart';
import 'package:med_dos/core/model/position.dart';
import 'package:med_dos/features/home_menu/presintion/screen/docto_%20details/data/model/Appointment.dart';

class DoctorModel {
  final String id;
  final String name;
  final String specialist;
  final String image;
  final String gender;
  final String about;
  final timeOfPrivew;
  final String location;
  final Position position;
  final previewPrice;
  final phone;
  final List<Appointment> workTime;

  DoctorModel(
      {required this.id,
      required this.name,
      required this.specialist,
      required this.image,
      required this.gender,
      required this.about,
      required this.location,
      required this.position,
      required this.timeOfPrivew,
      required this.workTime,
      required this.previewPrice,
      required this.phone});

  factory DoctorModel.fromJson(json) {
    return DoctorModel(
        id: json[ApiKeys.id],
        name: json[ApiKeys.firstName] + " " + json[ApiKeys.lastName],
        specialist: json['jurisdiction_sub']['Sub_Jurisdiction'],
        image: json['photo'],
        gender: json[ApiKeys.gender],
        location: json['about_location'],
        about: json['about_certificates'],
        previewPrice: json['Preview_price'],
        timeOfPrivew: json['Preview_time'],
        phone: json['phone_number'],
        position: Position(lat:json['latitudes'],lan:json['longitude']),
        workTime: json['workTime'].map((e)=>Appointment.fromJson(e)).toList()
    );
  }
}
