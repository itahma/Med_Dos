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
import 'package:med_dos/features/booking/data/repository/booking_repository.dart';
import 'package:med_dos/features/booking/presentation/cubit/booking_cubit.dart';
import 'package:med_dos/features/home/data/repository/home_repository.dart';

import 'package:med_dos/features/home/presentation/cubit/home_cubit.dart';
import 'package:med_dos/features/home_menu/data/search_repository/search_repository.dart';
import 'package:med_dos/features/home_menu/presintion/cubit/search_cubit.dart';
import 'package:med_dos/features/home_menu/presintion/screen/docto_%20details/data/repostory/Doctor_repository.dart';
import 'package:med_dos/features/home_menu/presintion/screen/docto_%20details/presentation/cubit/book_appointment/book_appointment_cubit.dart';
import 'package:med_dos/features/home_menu/presintion/screen/docto_%20details/presentation/cubit/book_soon_appointment/book_soon_appointment_cubit.dart';
import 'package:med_dos/features/home_menu/presintion/screen/docto_%20details/presentation/cubit/doctor_cubit.dart';
import 'package:med_dos/features/home_menu/presintion/screen/docto_%20details/presentation/cubit/doctors_list/doctor_list_cubit.dart';
import 'package:med_dos/features/home_menu/presintion/screen/healthCenters_detalis/data/repository/HealthCenterRepository.dart';
import 'package:med_dos/features/home_menu/presintion/screen/healthCenters_detalis/presentation/cubit/doctor_center_cubit/doctor_center_cubit.dart';
import 'package:med_dos/features/home_menu/presintion/screen/healthCenters_detalis/presentation/cubit/health_center_cubit.dart';
import 'package:med_dos/features/home_menu/presintion/screen/radiologe_center/data/radio_center_repository/radio_center_repository.dart';
import 'package:med_dos/features/home_menu/presintion/screen/radiologe_center/presentation/cubit/radio_center_cubit.dart';
import 'package:med_dos/features/myConsultations/chat/data/repository/messages_repository.dart';
import 'package:med_dos/features/myConsultations/chat/presentation/messages_Cubit/messages_cubit.dart';
import 'package:med_dos/features/myConsultations/data/repository/consulations_repository.dart';
import 'package:med_dos/features/myConsultations/presentation/Consultions_Cubit/consulation_cubit.dart';
import 'package:med_dos/features/profile/data/repository/profile_repository.dart';
import 'package:med_dos/features/profile/presentation/cubit/setting_cubit/setting_cubit.dart';

final sl = GetIt.instance;

void initServiceLocator() {
  sl.registerLazySingleton(
    () => GlobalCubit(),
  );
  sl.registerLazySingleton(
        () => DoctorCenterCubit(sl()),
  );
  sl.registerLazySingleton(
        () => SearchCubit(sl()),
  );
  sl.registerLazySingleton(
        () => SearchRepository(),
  );
  sl.registerLazySingleton(
        () => MessagesRepository(),
  );
  sl.registerLazySingleton(
        () => MessagesCubit(sl()),
  );
  sl.registerLazySingleton(
    () => DoctorListCubit(sl()),
  );
  sl.registerLazySingleton(
    () => BookingCubit(sl()),
  );
  sl.registerLazySingleton(
    () => BookingRepository(),
  );
  sl.registerLazySingleton(
    () => RadioCenterCubit(sl()),
  );
  sl.registerLazySingleton(
    () => RadioCenterRepository(),
  );

  sl.registerLazySingleton(
    () => ConsulationCubit(sl()),
  );
  sl.registerLazySingleton(
    () => ConsulationRepository(),
  );
  sl.registerLazySingleton(
    () => BookSoonAppointmentCubit(sl()),
  );
  sl.registerLazySingleton(
    () => BookAppointmentCubit(sl()),
  );
  sl.registerLazySingleton(
    () => ArticlesCubit(sl()),
  );
  sl.registerLazySingleton(
    () => DoctorRepository(),
  );
  sl.registerLazySingleton(
    () => ArticlesRepository(),
  );
  sl.registerLazySingleton(
    () => HealthCenterRepository(),
  );
  sl.registerLazySingleton(
    () => HealthCenterCubit(sl()),
  );
  sl.registerLazySingleton(
    () => DoctorCubit(sl()),
  );
  sl.registerLazySingleton(
    () => LoginCubit(sl()),
  );
  sl.registerLazySingleton(
    () => RegisterCubit(sl()),
  );
  sl.registerLazySingleton(
    () => RegisterSendCodeCubit(sl()),
  );
  sl.registerLazySingleton(
    () => ForgetPasswordCubit(sl()),
  );
  sl.registerLazySingleton(
    () => HomeCubit(sl()),
  );
  sl.registerLazySingleton(
    () => AuthRepository(),
  );
  sl.registerLazySingleton(
    () => CacheHelper(),
  );
  sl.registerLazySingleton(
    () => HomeRepository(),
  );
  sl.registerLazySingleton<ApiConsumer>(
    () => DioConsumer(sl()),
  );
  sl.registerLazySingleton(() => SettingCubit(sl()));
  sl.registerLazySingleton(
    () => ProfileRepository(),
  );
  sl.registerLazySingleton(
    () => Dio(),
  );
}
