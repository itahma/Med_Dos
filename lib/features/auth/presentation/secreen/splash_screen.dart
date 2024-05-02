import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:med_dos/core/routes/app_routes.dart';
import 'package:med_dos/core/utils/app_colors.dart';
import 'package:med_dos/core/utils/widget/app_string.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState(){
    navigateAfterThreeSeconds();
    super.initState();
  }
  void navigateAfterThreeSeconds(){
    Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.pushNamedAndRemoveUntil(
          context,
          Routes.onBoarding1Screen,
              (Route<dynamic> route) =>false);
    });
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Text(AppString.medDos,
        style: Theme.of(context).textTheme.displayLarge,
        ),
      ),

    );
  }
}
