import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:med_dos/core/local/app_local.dart';
import 'package:med_dos/core/utils/app_colors.dart';
import 'package:med_dos/core/utils/commons.dart';
import 'package:med_dos/features/home_menu/presintion/screen/docto_%20details/presentation/cubit/doctor_cubit.dart';
import 'package:med_dos/features/home_menu/presintion/screen/docto_%20details/presentation/cubit/doctors_list/doctor_list_cubit.dart';

import '../../../../../../../core/utils/app_string.dart';
import '../component/doctor_item_component.dart';

class DoctorMenu extends StatefulWidget {
  String sec;

  DoctorMenu({Key? key, required this.sec}) : super(key: key);

  @override
  State<DoctorMenu> createState() => _DoctorMenuState();
}

class _DoctorMenuState extends State<DoctorMenu> {
  @override
  void initState() {
    BlocProvider.of<DoctorListCubit>(context).getDoctorList(widget.sec);
    super.initState();
  }

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
          body: BlocConsumer<DoctorListCubit, DoctorListState>(
            listener: (_, state) {
              if (state is ErrorDoctorList) {
                showToast(message: state.error, state: ToastState.error);
              }
            },
            builder: (_, state) {
              if (state is LoadingDoctorList) {
                return Container(
                  child: Center(
                    child: SpinKitFadingCircle(
                      color: AppColors.primary,
                    ),
                  ),
                );
              }
              else if (state is LoadedDoctorList) {
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
                                AppString.specialization.tr(context),
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
                          itemCount: state.doctors.length,
                          itemBuilder: (context, index) => Padding(
                              padding: EdgeInsets.all(8),
                              child: DoctorItemComponent(
                                doctorModel: state.doctors[index],
                              )),
                        ),
                      ),
                    ],
                  ),
                );
              }

              else if(state is ErrorDoctorList){
                return Container(
                  child: Center(child: Text("Not Found Doctor")),
                );
              }
              else return Container();
            },
          )),
    );
  }
}
