class EndPoint {
  static const String host = 'http://192.168.72.249:8000';
  static const String baseUrl = '$host/api/';
  static const String ImageUrl = '$host/';
  /////Auth/////////////////////////////////////////////////////////
  static const String medSignIn = 'Auth/login';
  static const String medSignUp = 'user/adduserProfile';
  static const String sendCode = 'Auth/resetpassword';
  static const String registerSendCode = 'Auth/register';
  static const String changeForgottenPassword = 'Auth/validateCode';
  static const String getProfile = 'user/showmyProfile';
 //////////////////////////cons////////////////////////////////////
  // /
  static const String createConnunction = 'user/addCommunication';
  static const String getAllConnunction = 'user/getCommunications';
  static const String getMessageConnunction = 'user/getCommunications';
  /////////////////////Doctor////////////////////////////////////////
  static const String getAllSpecialist = 'getAllSpecialist';
  static const String getDoctorInSpecialist= 'User/searchDoctors';
  static const String getDoctorInfo = 'user/showDoctorInfo';
  static const String getTimeDay = 'user/availableSlots';
  static const String getSoonestAppointment = 'user/nextAvailableSlot';

  static const String bookAppointment = 'user/bookSlot';
  static const String showMybockings = 'user/showMybockings';
  static const String cancelbocking = 'user/cancelBooking';

  ///////////////////////////Article///////////////////////////////////
  static const String getAllArticle = 'user/showallPost';
  static const String getArticleInfo = 'getArticleInfo';
  ////////////////////////search///////////////////////////////////////
  static const String searchAdoctor = 'searchAdoctor';
  ///////////////////////////Health Center////////////////////////////
  static const String getAllHealthCenter= 'getAllArticle';
  static const String getHealthCenterInfo = 'getArticleInfo';
  ///////////////////////////Laboratories/////////////////////////////
  static const String getAllRadioCenter = 'user/showallRadiologyLab';
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
  static const String id='_id';
  static const String specialist='specialist';
  static const String imageDoctor='image';

}
