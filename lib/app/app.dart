import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:med_dos/core/routes/app_routes.dart';
import 'package:med_dos/core/theme/App_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428,926),
      builder: (context,child)=>
       MaterialApp(
        initialRoute: Routes.intitlRoute,
       onGenerateRoute: AppRoutes.generateRoute,
        debugShowCheckedModeBanner: false,
        theme: getAppTheme()
      ),
    );
  }
}
