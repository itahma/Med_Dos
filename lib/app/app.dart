import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:med_dos/core/routes/app_routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routes.intitlRoute,
     onGenerateRoute: AppRoutes.generateRoute,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.deepPurple,)
    ),
    );
  }
}
