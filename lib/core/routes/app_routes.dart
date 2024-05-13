import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:med_dos/features/auth/presentation/secreen/register_send_code.dart';
import 'package:med_dos/features/auth/presentation/secreen/setting_screen.dart';
import 'package:med_dos/features/auth/presentation/secreen/Onboarding1_splash.dart';
import 'package:med_dos/features/auth/presentation/secreen/login_screen.dart';
import 'package:med_dos/features/auth/presentation/secreen/register_screen.dart';
import 'package:med_dos/features/auth/presentation/secreen/reset_password_screen.dart';
import 'package:med_dos/features/auth/presentation/secreen/send_code_screen.dart';
import 'package:med_dos/features/auth/presentation/secreen/splash_screen.dart';
import 'package:med_dos/features/home/screen/home_screen.dart';
import 'package:med_dos/features/profile/presentation/secreen/change_password_screen.dart';
import 'package:med_dos/features/profile/presentation/secreen/update_profile_screen.dart';

import '../../features/profile/presentation/secreen/profile_home_screen.dart';

class Routes{

 static const String intitlRoute ='/';
 static const String login='/login';
 static const String sendCode='/sendCode';
 static const String restPassword='/restPassword';
 static const String profileHome='/profileHome';
 static const String updateProfile='/updateProfile';
 static const String setting='/setting';
 static const String changePassword='/changePassword';
 static const String onBoarding1Screen='/onBoarding1Screen';
 static const String register='/register';
 static const String home='/home';
 static const String registerCode='/register_send_code';


}
class AppRoutes{
 static Route? generateRoute(RouteSettings routeSettings){
  switch (routeSettings.name){
   case Routes.intitlRoute:
    return MaterialPageRoute(builder: (_)=>const OnBoarding1Screen());
   case Routes.onBoarding1Screen:
    return MaterialPageRoute(builder: (_)=> OnBoarding1Screen());
     case Routes.login:
    return MaterialPageRoute(builder: (_)=>const LoginScreen());
   case Routes.register:
    return MaterialPageRoute(builder: (_)=>const RegisterScreen());
   case Routes.sendCode:
    return MaterialPageRoute(builder: (_)=>const SendCodeScreen());
   case Routes.restPassword:
    return MaterialPageRoute(builder: (_)=>const ReSetPassword());
   case Routes.profileHome:
    return MaterialPageRoute(builder: (_)=>const ProfileHome());
   case Routes.updateProfile:
    return MaterialPageRoute(builder: (_)=>const UpdateProfile());
   case Routes.setting:
    return MaterialPageRoute(builder: (_)=>const SettingScreen());
   case Routes.changePassword:
    return MaterialPageRoute(builder: (_)=>const ChangePasswordScreen());
   case Routes.home:
    return MaterialPageRoute(builder: (_)=>const HomeScreen());
   case Routes.registerCode:
    return MaterialPageRoute(builder: (_)=>const RegisterSendCode());

   default:
    return MaterialPageRoute(builder: (_)=>const Scaffold(
     body: Center(child: Text('No Found Route'),),
    ));


  }
 }
}