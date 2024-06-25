class EndPoint {
  static const String baseUrl = 'http://192.168.124.14:8000/api/';
  /////Auth/////////////////////////////////////////////////////////
  static const String medSignIn = 'Auth/login';
  static const String medSignUp = 'user/adduserProfile';
  static const String sendCode = 'Auth/resetpassword';
  static const String registerSendCode = 'Auth/register';
  static const String changeForgottenPassword = 'Auth/validateCode';
  /////////////////////Doctor////////////////////////////////////////
  static const String getAllSpecialist = 'getAllSpecialist';
  static const String getDoctorInSpecialist= 'getDoctorInSpecialist';
  static const String getDoctorInfo = 'getDoctorInfo';
  static const String getSoonestAppointment = 'getSoonestAppointment';
  static const String bookAppointment = 'bookAppointment';
  ///////////////////////////Article///////////////////////////////////
  static const String getAllArticle = 'getAllArticle';
  static const String getArticleInfo = 'getArticleInfo';
  ////////////////////////search///////////////////////////////////////
  static const String searchAdoctor = 'searchAdoctor';
  ///////////////////////////Health Center////////////////////////////
  static const String getAllHealthCenter= 'getAllArticle';
  static const String getHealthCenterInfo = 'getArticleInfo';
  ///////////////////////////Laboratories/////////////////////////////
  static const String getAllLaboratories = 'getAllArticle';
  static const String getLaboratoriesInfo = 'getArticleInfo';
}

class ApiKeys {
  static const String firstName='First_Name';
  static const String lastName='Last_Name';
  static const  String phone='phone';
  static const String email = 'email';
  static const String dataBirth = 'dateBearthday';
  static const String password = 'password';
  static const String confirmPassword = 'confirmPassword';
  static const String code = 'code';
  static const String message = 'message';
  static const String token = 'x-jwt';
  static const String gender = 'gender';
  static const String name='name';
  static const String id='id';
  static const String specialist='specialist';
  static const String imageDoctor='image';

}
