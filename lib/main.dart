import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:med_dos/core/bloc/cubit/global_cubit.dart';
import 'package:med_dos/core/database/cache/cache_helper.dart';
import 'package:med_dos/features/auth/presentation/cubit/login/login_cubit.dart';

import 'app/app.dart';
import 'core/service/service_locatro.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initServiceLocator();
  await sl<CacheHelper>().init();


  runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
            sl<GlobalCubit>()
              ..getCacheLang(),
          ),
          BlocProvider(
            create: (context) => sl<LoginCubit>(),
          ),
        ],
        child: MyApp(),
      ));
}

