class ArticlesModel {
  final String title;
  final String contant;
  final String doctorName;
  final String photo;

  ArticlesModel({
    required this.title,
    required this.contant,
    required this.doctorName,
    required this.photo,
  });

  factory ArticlesModel.fromJson(json) {
    return ArticlesModel(
        title: json['title'],
        contant: json['contant'],
        doctorName: json['doctor_name'],
        photo: json["photo"]);
  }
}
