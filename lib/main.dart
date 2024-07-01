import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:med_dos/core/bloc/cubit/global_cubit.dart';
import 'package:med_dos/core/database/cache/cache_helper.dart';
import 'package:med_dos/features/articles/presentation/cubit/articles_cubit.dart';
import 'package:med_dos/features/auth/presentation/cubit/forget_password_cubit/forget_password_cubit.dart';
import 'package:med_dos/features/auth/presentation/cubit/login/login_cubit/login_cubit.dart';
import 'package:med_dos/features/auth/presentation/cubit/register_send_code/redister_send_code_cubit.dart';
import 'package:med_dos/features/auth/presentation/cubit/registr_cubit/register_cubit.dart';
import 'package:med_dos/features/booking/presentation/cubit/booking_cubit.dart';
import 'package:med_dos/features/home/presentation/cubit/home_cubit.dart';
import 'package:med_dos/features/home_menu/presintion/screen/docto_%20details/presentation/cubit/book_appointment/book_appointment_cubit.dart';
import 'package:med_dos/features/home_menu/presintion/screen/docto_%20details/presentation/cubit/book_soon_appointment/book_soon_appointment_cubit.dart';
import 'package:med_dos/features/home_menu/presintion/screen/docto_%20details/presentation/cubit/doctor_cubit.dart';
import 'package:med_dos/features/home_menu/presintion/screen/docto_%20details/presentation/cubit/doctors_list/doctor_list_cubit.dart';
import 'package:med_dos/features/home_menu/presintion/screen/radiologe_center/presentation/cubit/radio_center_cubit.dart';
import 'package:med_dos/features/myConsultations/chat/presentation/messages_Cubit/messages_cubit.dart';
import 'package:med_dos/features/myConsultations/presentation/Consultions_Cubit/consulation_cubit.dart';
import 'package:med_dos/features/profile/presentation/cubit/setting_cubit/setting_cubit.dart';
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
          BlocProvider(
            create: (context) => sl<DoctorCubit>(),
          ),
          BlocProvider(
            create: (context) => sl<ArticlesCubit>()..getAllArticles(),
          ),
          BlocProvider(
            create: (context) => sl<SettingCubit>()..getProfile(),
          ),
          BlocProvider(
            create: (context) => sl<DoctorListCubit>(),
          ),
          BlocProvider(
            create: (context) => sl<BookAppointmentCubit>(),
          ), BlocProvider(
            create: (context) => sl<BookSoonAppointmentCubit>(),
          ),
          BlocProvider(
            create: (context) => sl<ConsulationCubit>()..getMyConsulation(),
          ),
          BlocProvider(
            create: (context) => sl<RadioCenterCubit>()..getAllRadioCenter(),
          ),
          BlocProvider(
            create: (context) => sl<BookingCubit>()..getMyBooking(),
          ),
          BlocProvider(
            create: (context) => sl<MessagesCubit>(),
          ),
        ],
        child: MyApp(),
      ));
}

