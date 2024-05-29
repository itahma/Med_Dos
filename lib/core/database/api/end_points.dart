class EndPoint {
  static const String baseUrl = 'http://192.168.109.128:8000/api/';
  static const String medSignIn = 'Auth/login';
  static const String medSignUp = 'user/adduserProfile';
  static const String sendCode = 'Auth/resetpassword';
  static const String registerSendCode = 'Auth/register';
  static const String changeForgottenPassword = 'Auth/validateCode';

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
}
