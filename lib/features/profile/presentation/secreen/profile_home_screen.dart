import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:med_dos/core/local/app_local.dart';
import 'package:med_dos/core/routes/app_routes.dart';
import 'package:med_dos/core/utils/app_colors.dart';
import 'package:med_dos/core/utils/commons.dart';

import 'package:med_dos/features/auth/presentation/cubit/login/login_cubit/login_cubit.dart';
import 'package:med_dos/features/auth/presentation/cubit/registr_cubit/register_cubit.dart';
import 'package:med_dos/features/booking/presentation/screeen/my_booking.dart';
import 'package:med_dos/features/home_menu/presintion/screen/docto_%20details/presentation/screen/my_booking.dart';
import 'package:med_dos/features/profile/presentation/cubit/setting_cubit/setting_cubit.dart';
import 'package:med_dos/features/profile/presentation/cubit/setting_cubit/setting_state.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

import '../../../../core/utils/app_string.dart';

class ProfileHome extends StatelessWidget {
  const ProfileHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<SettingCubit, SettingState>(listener: (_, state) {
      if (state is ErrorLoadProfile) {
        showToast(message: state.error, state: ToastState.error);
      }
    }, builder: (_, state) {
      if (state is LoadingProfile) {
        return Container(
          child: Center(
            child: SpinKitFadingCircle(
              color: AppColors.primary,
            ),
          ),
        );
      }
      if (state is LoadedProfile) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Column(
              children: [
                Text(
                  state.profileModel.name,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          const Icon(
                            Icons.cake,
                            color: AppColors.primary,
                          ),
                          Text(
                            ' ${DateTime.now().year - DateTime.parse(state.profileModel.dateBearthday).year}',
                            style: TextStyle(
                                color: Colors.blueAccent.shade100,
                                fontSize: 17),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      Column(
                        children: [
                          const Icon(Icons.phone, color: AppColors.primary),
                          Text(
                            state.profileModel.phone,
                            style: TextStyle(
                                color: Colors.blueAccent.shade100,
                                fontSize: 17),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      Column(
                        children: [
                          const Icon(
                            Icons.male_outlined,
                            color: AppColors.primary,
                          ),
                          Text(
                            state.profileModel.gender,
                            style: TextStyle(
                                color: Colors.blueAccent.shade100,
                                fontSize: 17),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(height: 50, thickness: 1, color: Colors.blue.shade50),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xff91BAEF).withOpacity(.2),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      //Border.all
                      height: 55,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.feed_outlined,
                              size: 25,
                              color: AppColors.primary,
                            ),
                            const SizedBox(width: 30),
                            Text(
                              AppString.medicalRecord.tr(context),
                              style: const TextStyle(
                                  color: AppColors.grey, fontSize: 18),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => BookingScreen()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xff91BAEF).withOpacity(.2),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      //Border.all
                      height: 55,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.book_outlined,
                              size: 25,
                              color: AppColors.primary,
                            ),
                            const SizedBox(width: 30),
                            Text(
                              "my Boocking",
                              style: const TextStyle(
                                  color: AppColors.grey, fontSize: 18),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: InkWell(
                    onTap: () {
                      navigate(context: context, route: Routes.setting);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xff91BAEF).withOpacity(.2),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      //Border.all
                      height: 55,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.settings,
                              size: 25,
                              color: AppColors.primary,
                            ),
                            const SizedBox(width: 30),
                            Text(
                              AppString.settings.tr(context),
                              style: const TextStyle(
                                  color: AppColors.grey, fontSize: 18),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: InkWell(
                    onTap: () async {
                      navigate(context: context, route: Routes.helpScreen);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xff91BAEF).withOpacity(.2),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      //Border.all
                      height: 55,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.support,
                              size: 25,
                              color: AppColors.primary,
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            Text(AppString.support.tr(context),
                                style: const TextStyle(
                                    color: AppColors.grey, fontSize: 18))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Divider(height: 50, thickness: 1, color: Colors.blue.shade50),
              ],
            ),
          ),
        );
      }
      return Container();
    }));
  }
}
