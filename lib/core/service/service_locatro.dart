import 'package:get_it/get_it.dart';
import 'package:med_dos/core/bloc/cubit/global_cubit.dart';
import 'package:med_dos/core/database/cache/cache_helper.dart';

final sl =GetIt.instance;
void initServiceLocator (){
  sl.registerLazySingleton(() =>CacheHelper() ,);
  sl.registerLazySingleton(() =>GlobalCubit() ,);
}