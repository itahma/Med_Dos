class Appointment {
  final day;
  final start;
  final end;

  Appointment({
   required this.day,
  required  this.start,
   required this.end,
  });
  factory Appointment.fromJson(json){
    return Appointment(day: json['day'], start:json['start'], end: json['end']);
  }
}
