class Booking {
  final String id;
  final String doctorName;

  final String date;
  final String start;
  final String end;

  Booking({
    required this.id,
    required this.doctorName,
    required this.date,
    required this.start,
    required this.end,
  });

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      id: json['_id'],
      doctorName: json['doctor_id']['First_Name'] +
          " " +
          json['doctor_id']['Last_Name'],
      date: json['date'],
      start: json['start'],
      end: json['end'],
    );
  }
}
