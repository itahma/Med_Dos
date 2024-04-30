import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:med_dos/core/routes/app_routes.dart';
import 'package:med_dos/core/utils/app_colors.dart';

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
      Navigator.pushNamed(context,Routes.onBoarding1Screen);
    });
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Text('MedDos',
        style: Theme.of(context).textTheme.displayLarge,
        ),
      ),

    );
  }
}
