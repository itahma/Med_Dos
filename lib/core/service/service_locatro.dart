import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:med_dos/core/bloc/cubit/global_cubit.dart';
import 'package:med_dos/core/database/api/api_consumer.dart';
import 'package:med_dos/core/database/api/dio_consumer.dart';
import 'package:med_dos/core/database/cache/cache_helper.dart';
import 'package:med_dos/features/articles/data/repository/articles_repository.dart';
import 'package:med_dos/features/articles/presentation/cubit/articles_cubit.dart';
import 'package:med_dos/features/auth/data/repository/auth_repository.dart';
import 'package:med_dos/features/auth/presentation/cubit/forget_password_cubit/forget_password_cubit.dart';
import 'package:med_dos/features/auth/presentation/cubit/login/login_cubit/login_cubit.dart';
import 'package:med_dos/features/auth/presentation/cubit/register_send_code/redister_send_code_cubit.dart';
import 'package:med_dos/features/auth/presentation/cubit/registr_cubit/register_cubit.dart';
import 'package:med_dos/features/auth/presentation/secreen/register_send_code.dart';
import 'package:med_dos/features/home/data/repository/home_repository.dart';

import 'package:med_dos/features/home/presentation/cubit/home_cubit.dart';
import 'package:med_dos/features/home_menu/presintion/screen/docto_%20details/data/repostory/Doctor_repository.dart';
import 'package:med_dos/features/home_menu/presintion/screen/docto_%20details/presentation/cubit/doctor_cubit.dart';
import 'package:med_dos/features/home_menu/presintion/screen/healthCenters_detalis/data/repository/HealthCenterRepository.dart';
import 'package:med_dos/features/home_menu/presintion/screen/healthCenters_detalis/presentation/cubit/health_center_cubit.dart';

final sl =GetIt.instance;
void initServiceLocator (){

  sl.registerLazySingleton(() =>GlobalCubit() ,);
  sl.registerLazySingleton(() =>ArticlesCubit(sl()) ,);
  sl.registerLazySingleton(() =>DoctorRepository(),);
  sl.registerLazySingleton(() =>ArticlesRepository(),);
  sl.registerLazySingleton(() =>HealthCenterRepository() ,);
  sl.registerLazySingleton(() =>HealthCenterCubit(sl()) ,);
  sl.registerLazySingleton(() =>DoctorCubit(sl()) ,);
  sl.registerLazySingleton(() =>LoginCubit(sl()) ,);
  sl.registerLazySingleton(() =>RegisterCubit(sl()) ,);
  sl.registerLazySingleton(() =>RegisterSendCodeCubit(sl()) ,);
  sl.registerLazySingleton(() =>ForgetPasswordCubit(sl()) ,);
  sl.registerLazySingleton(() =>HomeCubit(sl()) ,);
  sl.registerLazySingleton(() =>AuthRepository() ,);
  sl.registerLazySingleton(() =>CacheHelper() ,);
  sl.registerLazySingleton(() =>HomeRepository() ,);
  sl.registerLazySingleton<ApiConsumer>(() =>DioConsumer(sl()) ,);
  sl.registerLazySingleton(() =>Dio() ,);
}