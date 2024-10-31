import 'package:med_dos/core/database/api/end_points.dart';
import 'package:med_dos/core/model/position.dart';
import 'package:med_dos/features/home_menu/presintion/screen/docto_%20details/data/model/Appointment.dart';

class DoctorCenterModel {
  final String id;
  final String name;
  final String specialist;
 final List workingDays;
  final String? image;

  DoctorCenterModel({
    required this.id,
    required this.name,
    required this.specialist,
    required this.image,
    required this.workingDays
  });

  factory DoctorCenterModel.fromJson(json) {
    return DoctorCenterModel(
      id: json[ApiKeys.id],
      name: json["firstName"] + " " + json["lastName"],
      specialist: json['jurisdiction'] + "/ " + json['subJurisdiction'],
      image: json['photo'] ?? "",
      workingDays:json["workingDays"]!=null? (json["workingDays"].map((e)=>Appointment.fromJson(e)).toList()):[]
    );
  }
}
