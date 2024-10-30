import 'package:flutter/material.dart';
import 'package:med_dos/core/utils/app_colors.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
              AppColors.primary.withOpacity(.8),
              AppColors.primary
            ])),
      ),
    );
  }
}
