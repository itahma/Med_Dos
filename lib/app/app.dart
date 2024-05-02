import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:med_dos/core/local/app_local.dart';
import 'package:med_dos/core/routes/app_routes.dart';
import 'package:med_dos/core/theme/App_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'package:med_dos/features/auth/presentation/secreen/Onboarding1_splash.dart';
class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey =
  GlobalKey<NavigatorState>();
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428,926),
      builder: (context,child)=>
          MaterialApp(
              navigatorKey: NavigationService.navigatorKey,
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,

              AppLocalizations.delegate,
              // Add other delegates here
            ],
            supportedLocales:const [
              Locale('ar','SY'),
              Locale('en','US'),
            ] ,
locale: const Locale('en'),
            initialRoute: Routes.intitlRoute,
              onGenerateRoute: AppRoutes.generateRoute,
               debugShowCheckedModeBanner: false,
               theme: getAppTheme()

          )
    );
  }
}
