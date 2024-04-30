import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:med_dos/core/utils/app_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

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
