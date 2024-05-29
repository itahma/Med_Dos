import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:med_dos/core/bloc/cubit/global_cubit.dart';
import 'package:med_dos/core/database/cache/cache_helper.dart';
import 'package:med_dos/core/service/local_notification_service.dart';
import 'package:med_dos/core/service/work_manager_service.dart';
import 'package:med_dos/features/auth/presentation/cubit/forget_password_cubit/forget_password_cubit.dart';
import 'package:med_dos/features/auth/presentation/cubit/login/login_cubit/login_cubit.dart';
import 'package:med_dos/features/auth/presentation/cubit/register_send_code/redister_send_code_cubit.dart';
import 'package:med_dos/features/auth/presentation/cubit/registr_cubit/register_cubit.dart';
import 'package:med_dos/features/home/cubit/home_cubit.dart';

import 'app/app.dart';
import 'core/service/service_locatro.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initServiceLocator();
  await sl<CacheHelper>().init();
  // await Future.wait([
  //   LocalNotificationService.init(),
  //   WorkManagerService().init(),
  // ]);


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
          BlocProvider(
            create: (context) => sl<RegisterCubit>(),
          ),
          BlocProvider(
            create: (context) => sl<ForgetPasswordCubit>(),
          ),
          BlocProvider(
            create: (context) => sl<HomeCubit>(),
          ),
          BlocProvider(
            create: (context) => sl<RegisterSendCodeCubit>(),
          ),
        ],
        child: MyApp(),
      ));
}

