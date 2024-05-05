import 'package:get_it/get_it.dart';
import 'package:med_dos/core/bloc/cubit/global_cubit.dart';
import 'package:med_dos/core/database/cache/cache_helper.dart';
import 'package:med_dos/features/auth/presentation/cubit/login/login_cubit.dart';

final sl =GetIt.instance;
void initServiceLocator (){

  sl.registerLazySingleton(() =>GlobalCubit() ,);
  sl.registerLazySingleton(() =>LoginCubit() ,);
  sl.registerLazySingleton(() =>CacheHelper() ,);
}