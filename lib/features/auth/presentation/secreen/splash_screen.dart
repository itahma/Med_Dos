import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:med_dos/core/database/api/end_points.dart';
import 'package:med_dos/core/database/cache/cache_helper.dart';
import 'package:med_dos/core/local/app_local.dart';
import 'package:med_dos/core/routes/app_routes.dart';
import 'package:med_dos/core/utils/app_assets.dart';
import 'package:med_dos/core/utils/app_colors.dart';
import 'package:med_dos/core/utils/commons.dart';
import 'package:med_dos/core/utils/widget/app_string.dart';
import 'package:med_dos/core/utils/widget/customimage.dart';

import '../../../../core/service/service_locatro.dart';

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
    Future.delayed(const Duration(seconds: 3)).then((value) async{
     await sl<CacheHelper>().getData(key: ApiKeys.token,
     )==null
         ?navigate(context: context, route: Routes.onBoarding1Screen)
         :navigate(context: context, route: Routes.home);
    });
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body:Center(
        child: CustomImage(
          imagePath: AppAssets.logoIm,
        ),
      )

    );
  }
}
