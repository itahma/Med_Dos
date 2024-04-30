import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:med_dos/core/utils/setting_screen.dart';
import 'package:med_dos/features/auth/presentation/secreen/Onboarding1_splash.dart';
import 'package:med_dos/features/auth/presentation/secreen/Onboarding2_splash.dart';
import 'package:med_dos/features/auth/presentation/secreen/Onboarding3_splash.dart';
import 'package:med_dos/features/auth/presentation/secreen/Onboarding4_splash.dart';
import 'package:med_dos/features/auth/presentation/secreen/login_screen.dart';
import 'package:med_dos/features/auth/presentation/secreen/reset_password_screen.dart';
import 'package:med_dos/features/auth/presentation/secreen/send_code_screen.dart';
import 'package:med_dos/features/auth/presentation/secreen/splash_screen.dart';
import 'package:med_dos/features/profile/presentation/secreen/change_password_screen.dart';
import 'package:med_dos/features/profile/presentation/secreen/update_profile_screen.dart';

import '../../features/profile/presentation/secreen/profile_home_screen.dart';

class Routes{

 static const String intitlRoute ='/';
 static const String changeLan='/changeLan';
 static const String login='/login';
 static const String sendCode='/sendCode';
 static const String restPassword='/restPassword';
 static const String profileHome='/profileHome';
 static const String updateProfile='/updateProfile';
 static const String setting='/setting';
 static const String changePassword='/changePassword';
 static const String onBoarding1Screen='/onBoarding1Screen';
 static const String onBoarding2Screen='/onBoarding2Screen';
 static const String onBoarding3Screen='/onBoarding3Screen';
 static const String onBoarding4Screen='/onBoarding4Screen';

}
class AppRoutes{
 static Route? generateRoute(RouteSettings routeSettings){
  switch (routeSettings.name){
   case Routes.intitlRoute:
    return MaterialPageRoute(builder: (_)=>const SplashScreen());
   case Routes.onBoarding1Screen:
    return MaterialPageRoute(builder: (_)=>const OnBoarding1Screen());
   case Routes.onBoarding2Screen:
    return MaterialPageRoute(builder: (_)=>const OnBoarding2Screen());
   case Routes.onBoarding3Screen:
    return MaterialPageRoute(builder: (_)=>const OnBoarding3Screen());
   case Routes.onBoarding4Screen:
    return MaterialPageRoute(builder: (_)=>const OnBoarding4Screen());
   case Routes.login:
    return MaterialPageRoute(builder: (_)=>const LoginScreen());
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
   default:
    return MaterialPageRoute(builder: (_)=>const Scaffold(
     body: Center(child: Text('No Found Route'),),
    ));


  }
 }
}