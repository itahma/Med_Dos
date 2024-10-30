class ProfileModel {
  final String name;

  final String dateBearthday;
  final String gender;
  final String phone;


  ProfileModel({

    required this.phone,
    required this.gender,
    required this.dateBearthday,
    required this.name,

  });

  factory ProfileModel.formJson(json) {
    return ProfileModel(

        phone: json['phone'],
        gender: json['gender'],
        dateBearthday: json['dateBearthday'],
        name: json['First_Name'] +" "+json['Last_Name'],
        );
  }
}
