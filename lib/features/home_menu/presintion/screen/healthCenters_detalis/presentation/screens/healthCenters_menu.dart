import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:med_dos/core/local/app_local.dart';
import 'package:med_dos/core/utils/app_colors.dart';
import 'package:med_dos/core/utils/commons.dart';
import 'package:med_dos/features/home_menu/presintion/screen/healthCenters_detalis/presentation/component/healthCenters_item_component.dart';
import 'package:med_dos/features/home_menu/presintion/screen/healthCenters_detalis/presentation/cubit/health_center_cubit.dart';

import '../../../../../../../core/utils/app_string.dart';

class HealthCentersMenu extends StatelessWidget {
  const HealthCentersMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              AppString.medDose,
              style: Theme.of(context).textTheme.displayMedium,
            ),
            elevation: 0,
          ),
          body: BlocConsumer<HealthCenterCubit, HealthCenterState>(
            listener: (context, state) {
              if (state is ErrorHealthCenter) {
                showToast(message: state.error, state: ToastState.error);
              }
            },
            builder: (context, state) {
              if (state is LoadingHealthCenter) {
                return Container(
                  child: Center(
                    child: SpinKitFadingCircle(
                      color: AppColors.primary,
                    ),
                  ),
                );
              }
              if (state is LoadedHealthCenter) {
                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: Center(
                              child: Text(
                                AppString.healthCenters.tr(context),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: AppColors.primary.withOpacity(.8),
                                ),
                              ),
                            ),
                          ),
                          const Spacer(),
                          Container(
                              height: 50.h,
                              width: 50.w,
                              decoration: BoxDecoration(
                                  color:
                                      const Color(0xff91BAEF).withOpacity(.3),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                  child: IconButton(
                                icon: const Icon(Icons.search_off_rounded),
                                onPressed: () {},
                              ))),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: state.healthcenter.length,
                          itemBuilder: (context, index) => Padding(
                              padding: EdgeInsets.all(8),
                              child: HealthCentersItemComponent(
                                healthCenterModel: state.healthcenter[index],
                              )),
                        ),
                      ),
                    ],
                  ),
                );
              }
              return Container();
            },
          )),
    );
  }
}
