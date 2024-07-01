import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:med_dos/features/auth/presentation/secreen/register_send_code.dart';
import 'package:med_dos/features/auth/presentation/secreen/splash_screen.dart';
import 'package:med_dos/features/help/screen/help_screen.dart';
import 'package:med_dos/features/home/presentation/screen/home_screen.dart';
import 'package:med_dos/features/home_menu/presintion/screen/docto_%20details/presentation/screen/my_booking.dart';
import 'package:med_dos/features/home_menu/presintion/screen/laboratories/presentation/screen/laboratories_detalis.dart';
import 'package:med_dos/features/home_menu/presintion/screen/laboratories/presentation/screen/laboratories_menu.dart';
import 'package:med_dos/features/home_menu/presintion/screen/search_screen.dart';
import 'package:med_dos/features/profile/presentation/secreen/my_medically_log.dart';
import 'package:med_dos/features/profile/presentation/secreen/setting_screen.dart';
import 'package:med_dos/features/auth/presentation/secreen/Onboarding1_splash.dart';
import 'package:med_dos/features/auth/presentation/secreen/login_screen.dart';
import 'package:med_dos/features/auth/presentation/secreen/register_screen.dart';
import 'package:med_dos/features/auth/presentation/secreen/reset_password_screen.dart';
import 'package:med_dos/features/auth/presentation/secreen/send_code_screen.dart';
import 'package:med_dos/features/profile/presentation/secreen/change_password_screen.dart';
import 'package:med_dos/features/profile/presentation/secreen/update_profile_screen.dart';
import '../../features/home_menu/presintion/screen/docto_ details/presentation/screen/booking_appointment.dart';
import '../../features/home_menu/presintion/screen/docto_ details/presentation/screen/doctor_details.dart';
import '../../features/home_menu/presintion/screen/docto_ details/presentation/screen/doctor_menu.dart';
import '../../features/home_menu/presintion/screen/healthCenters_detalis/presentation/screens/healthCenters_menu.dart';
import '../../features/home_menu/presintion/screen/pharmacies/presntation/screen/pharmacies_detalis.dart';
import '../../features/home_menu/presintion/screen/pharmacies/presntation/screen/pharmacies_menu.dart';
import '../../features/home_menu/presintion/screen/radiologe_center/presentation/screen/radiologe_center_detalis.dart';
import '../../features/home_menu/presintion/screen/radiologe_center/presentation/screen/radiologe_center_menu.dart';
import '../../features/myConsultations/presentation/screen/medicalConsultation_screen.dart';
import '../../features/profile/presentation/secreen/profile_home_screen.dart';

class Routes {
  static const String intitlRoute = '/';
  static const String login = '/login';
  static const String sendCode = '/sendCode';
  static const String restPassword = '/restPassword';
  static const String profileHome = '/profileHome';
  static const String updateProfile = '/updateProfile';
  static const String setting = '/setting';
  static const String changePassword = '/changePassword';
  static const String onBoarding1Screen = '/onBoarding1Screen';
  static const String register = '/register';
  static const String home = '/home';
  static const String registerCode = '/register_send_code';
  static const String doctorMenu = '/doctor_menu';
  static const String doctorDetails = '/doctor_details';
  static const String bookingAppointment = '/booking_appointment';
  static const String healthCentersMenu = '/healthCenters_menu';
  static const String searchScreen = '/search';
  static const String logScreen = '/log';
  static const String helpScreen = '/help_screen';
  static const String medicalConsultation = '/medicalConsultation_screen';
  static const String laboratoriesMenu = '/laboratories_menu';
  static const String laboratoriesDetails = '/laboratories_detalis';
  static const String radiologyCenterItemMenu = '/radiology_center_menu';
  static const String radiologyCenterItemDetails = '/radiology_center_detalis';
  static const String pharmaciesMenu = '/pharmacies_menu';
  static const String pharmaciesDetails = '/pharmacies_details';
  static const String myBooking = '/my_booking';
}

class AppRoutes {
  static Route? generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.intitlRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.onBoarding1Screen:
        return MaterialPageRoute(builder: (_) => const OnBoarding1Screen());
      case Routes.logScreen:
        return MaterialPageRoute(builder: (_) => const MyMedicallyLog());
      case Routes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.register:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case Routes.sendCode:
        return MaterialPageRoute(builder: (_) => const SendCodeScreen());
      case Routes.restPassword:
        return MaterialPageRoute(builder: (_) => const ReSetPassword());
      case Routes.profileHome:
        return MaterialPageRoute(builder: (_) => const ProfileHome());
      case Routes.updateProfile:
        return MaterialPageRoute(builder: (_) => const UpdateProfile());
      case Routes.setting:
        return MaterialPageRoute(builder: (_) => SettingScreen());
      case Routes.changePassword:
        return MaterialPageRoute(builder: (_) => const ChangePasswordScreen());
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.registerCode:
        return MaterialPageRoute(builder: (_) => const RegisterSendCode());
      case Routes.doctorMenu:
        return MaterialPageRoute(
            builder: (_) => DoctorMenu(
                  sec: "",
                ));
      case Routes.doctorDetails:
        return MaterialPageRoute(builder: (_) => DoctorDetails(""));

      case Routes.healthCentersMenu:
        return MaterialPageRoute(builder: (_) => const HealthCentersMenu());
      case Routes.searchScreen:
        return MaterialPageRoute(builder: (_) => const SearchScreen());
      case Routes.helpScreen:
        return MaterialPageRoute(builder: (_) => const HelpScreen());
      case Routes.medicalConsultation:
        return MaterialPageRoute(
            builder: (_) => MedicalConsultation(
                  id: "1",
                ));
      case Routes.laboratoriesMenu:
        return MaterialPageRoute(
            builder: (_) => const LaboratoriesCentersMenu());
      case Routes.laboratoriesDetails:
        return MaterialPageRoute(builder: (_) => const LaboratoriesDetails());
      case Routes.radiologyCenterItemMenu:
        return MaterialPageRoute(
            builder: (_) => const RadiologyCenterItemMenu());

      case Routes.pharmaciesMenu:
        return MaterialPageRoute(builder: (_) => const PharmaciesMenu());
      case Routes.pharmaciesDetails:
        return MaterialPageRoute(builder: (_) => const PharmaciesDetails());
      case Routes.myBooking:
        return MaterialPageRoute(builder: (_) => const MyBooking());

      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
                  body: Center(
                    child: Text('No Found Route'),
                  ),
                ));
    }
  }
}
