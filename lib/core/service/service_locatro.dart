import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:med_dos/core/bloc/cubit/global_cubit.dart';
import 'package:med_dos/core/database/api/api_consumer.dart';
import 'package:med_dos/core/database/api/dio_consumer.dart';
import 'package:med_dos/core/database/cache/cache_helper.dart';
import 'package:med_dos/features/auth/data/repository/auth_repository.dart';
import 'package:med_dos/features/auth/presentation/cubit/login/login_cubit.dart';

final sl =GetIt.instance;
void initServiceLocator (){

  sl.registerLazySingleton(() =>GlobalCubit() ,);
  sl.registerLazySingleton(() =>LoginCubit(sl()) ,);
  sl.registerLazySingleton(() =>AuthRepository() ,);
  sl.registerLazySingleton(() =>CacheHelper() ,);
  sl.registerLazySingleton<ApiConsumer>(() =>DioConsumer(sl()) ,);
  sl.registerLazySingleton(() =>Dio() ,);
}