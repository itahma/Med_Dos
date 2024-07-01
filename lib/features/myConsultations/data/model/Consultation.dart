class Consultations {
  final String id;
  final String firstName;
  final String lastName;
  final String photo;

  Consultations({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.photo,
  });

  factory Consultations.fromJson(Map<String, dynamic> json) {
    return Consultations(
      id: json['_id'],
      firstName: json['First_Name'],
      lastName: json['Last_Name'],
      photo: json['photo'],
    );
  }
}
