import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:med_dos/core/bloc/cubit/global_cubit.dart';
import 'package:med_dos/core/database/api/api_consumer.dart';
import 'package:med_dos/core/database/api/dio_consumer.dart';
import 'package:med_dos/core/database/cache/cache_helper.dart';
import 'package:med_dos/features/auth/data/repository/auth_repository.dart';
import 'package:med_dos/features/auth/presentation/cubit/forget_password_cubit/forget_password_cubit.dart';
import 'package:med_dos/features/auth/presentation/cubit/login/login_cubit/login_cubit.dart';
import 'package:med_dos/features/auth/presentation/cubit/register_send_code/redister_send_code_cubit.dart';
import 'package:med_dos/features/auth/presentation/cubit/registr_cubit/register_cubit.dart';
import 'package:med_dos/features/auth/presentation/secreen/register_send_code.dart';
import 'package:med_dos/features/home/cubit/home_cubit.dart';

final sl =GetIt.instance;
void initServiceLocator (){

  sl.registerLazySingleton(() =>GlobalCubit() ,);
  sl.registerLazySingleton(() =>LoginCubit(sl()) ,);
  sl.registerLazySingleton(() =>RegisterCubit(sl()) ,);
  sl.registerLazySingleton(() =>RegisterSendCodeCubit(sl()) ,);
  sl.registerLazySingleton(() =>ForgetPasswordCubit(sl()) ,);
  sl.registerLazySingleton(() =>HomeCubit() ,);
  sl.registerLazySingleton(() =>AuthRepository() ,);
  sl.registerLazySingleton(() =>CacheHelper() ,);
  sl.registerLazySingleton<ApiConsumer>(() =>DioConsumer(sl()) ,);
  sl.registerLazySingleton(() =>Dio() ,);
}