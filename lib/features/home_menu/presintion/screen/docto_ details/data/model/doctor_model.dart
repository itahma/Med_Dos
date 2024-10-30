import 'package:med_dos/core/database/api/end_points.dart';
import 'package:med_dos/core/model/position.dart';
import 'package:med_dos/features/home_menu/presintion/screen/docto_%20details/data/model/Appointment.dart';

class DoctorModel
{
  final String id;
  final String name;
  final String specialist;
  final String ?about_location;
  final String ?sub_specialist;
  final String ?image;
  final String ?gender;
  final String ?about;
  final int timeOfPrivew;
  final String location;
  final Position ?position;
  final int previewPrice;
  final String phone;
  final List ?workTime;

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
      required this.phone
      ,required this.sub_specialist,
        required this.about_location
      });

  factory DoctorModel.fromJson(json) {
    return DoctorModel(
        id: json[ApiKeys.id],
        name: json[ApiKeys.firstName] + " " + json[ApiKeys.lastName],
        specialist: json['jurisdiction_sub']['jurisdiction'],
        image: json['photo']??"",
        gender: json[ApiKeys.gender]??"",
        location: json['country_city']['city']+","+json['country_city']['country']??"",
        about: json['about_certificates']??"",
        previewPrice: json['Preview_price']??0,
        timeOfPrivew: json['Preview_time']??0,
        phone: json['phone_number'],
        sub_specialist: json['jurisdiction_sub']['Sub_Jurisdiction'],
        position:json['location']!=null?Position(lat:json['location']['coordinates'][0],lan:json['location']['coordinates'][1]):Position(lat: 0, lan: 0),
        about_location: json["about_location"]??"",
        workTime:json['workingDays']!=null? (json['workingDays'].map((e)=>Appointment.fromJson(e)).toList()):([])
    );
  }
}
