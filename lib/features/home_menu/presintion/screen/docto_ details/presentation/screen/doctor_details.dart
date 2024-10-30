import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:med_dos/core/database/api/end_points.dart';
import 'package:med_dos/core/local/app_local.dart';
import 'package:med_dos/core/model/position.dart';
import 'package:med_dos/core/routes/app_routes.dart';
import 'package:med_dos/core/utils/app_assets.dart';
import 'package:med_dos/core/utils/app_colors.dart';
import 'package:med_dos/core/utils/app_text_style.dart';
import 'package:med_dos/core/utils/commons.dart';
import 'package:med_dos/features/home_menu/presintion/screen/docto_%20details/data/model/Appointment.dart';
import 'package:med_dos/features/home_menu/presintion/screen/docto_%20details/presentation/cubit/doctor_cubit.dart';
import 'package:med_dos/features/home_menu/presintion/screen/docto_%20details/presentation/screen/booking_appointment.dart';
import 'package:med_dos/features/map/map.dart';
import 'package:med_dos/features/myConsultations/presentation/screen/medicalConsultation_screen.dart';

import '../../../../../../../core/utils/app_string.dart';
import '../../../../../../../core/widget/custom_cached_network_image.dart';

class DoctorDetails extends StatefulWidget {
  String id;

  DoctorDetails(this.id);

  @override
  State<DoctorDetails> createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorDetails> {
  @override
  void initState() {
    BlocProvider.of<DoctorCubit>(context).getDoctorInfo(widget.id);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<DoctorCubit, DoctorState>(listener: (ctx, state) {
        if (state is ErrorDoctorInfo) {
          showToast(message: state.error, state: ToastState.error);
        }
      }, builder: (ctx, state) {
        if (state is LoadingDoctorInfo) {
          return Container(
            child: Center(
              child: SpinKitFadingCircle(
                color: AppColors.primary,
              ),
            ),
          );
        }
        else if (state is LoadedDoctorInfo) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                AppString.medDose,
                style: Theme.of(context).textTheme.displayMedium,
              ),
              elevation: 0,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          child: IconButton(
                            icon: BlocProvider.of<DoctorCubit>(context).isLike
                                ? Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                  )
                                : Icon(Icons.favorite_border),
                            onPressed:
                                BlocProvider.of<DoctorCubit>(context).Like,
                          ),
                        ),
                        Spacer(),
                        Container(
                          child: IconButton(
                            icon: Icon(Icons.chat),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (_)=>MedicalConsultation(id:widget.id )));
                            },
                          ),
                        ),
                      ],
                    ),
                    Center(
                      child: Column(
                        children: [
                          SizedBox(
                            width: 150.w,
                            height: 150.h,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: CustomCachedNetworkImage(
                                fit: BoxFit.cover,
                                imageUrl: state.doctorModel.image != null
                                    ? EndPoint.ImageUrl +
                                        state.doctorModel.image!
                                    : "https://th.bing.com/th/id/OIP.rzvJIIoK4rs7kpN44Q5YegHaE8?rs=1&pid=ImgDetMain",
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            state.doctorModel.name,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            state.doctorModel.specialist +
                                (state.doctorModel.sub_specialist != null
                                    ? ("/ " + state.doctorModel.sub_specialist!)
                                    : ""),
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          width: 160.w,
                          decoration: BoxDecoration(
                              color: AppColors.primary.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Icon(Icons.timer, color: Colors.blue),
                              SizedBox(height: 5),
                              Text(
                                  '${AppLocalizations.of(context)!.translate(AppString.preview)} ${state.doctorModel.timeOfPrivew} ${AppLocalizations.of(context)!.translate(AppString.min)}'),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(8),
                          width: 160.w,
                          decoration: BoxDecoration(
                              color: AppColors.primary.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Icon(Icons.check_circle, color: Colors.green),
                              SizedBox(height: 5),
                              Text(
                                AppLocalizations.of(context)!
                                    .translate(AppString.availableNow),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.all(13),
                      width: double.infinity,
                      margin: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          color: AppColors.primary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  "${AppLocalizations.of(context)!.translate(AppString.aboutDoctor)} :",
                                  style: blueStyle()),
                              Text(AppString.male.tr(context),
                                  style: TextStyle(
                                      color: AppColors.primary, fontSize: 16)),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(state.doctorModel.about!)
                        ],
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.all(13),
                        width: double.infinity,
                        margin: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            color: AppColors.primary.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            Icon(
                              Icons.location_pin,
                              color: AppColors.primary,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(state.doctorModel.location +
                                "," +
                                state.doctorModel.about_location!)
                          ],
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      color: AppColors.primary.withOpacity(0.1),
                    ),
                    Text(
                      AppLocalizations.of(context)!
                          .translate(AppString.timeOfWork),
                      style: blueStyle(),
                    ),
                    Container(
                        height: 200,
                        child: ListView.builder(
                          itemBuilder: (_, i) {
                            return appoitmentItem(
                                state.doctorModel.workTime![i].day,
                                state.doctorModel.workTime![i].start,
                                state.doctorModel.workTime![i].end);
                          },
                          itemCount: state.doctorModel.workTime!.length,
                        )),
                    SizedBox(
                      height: 70,
                    )
                  ],
                ),
              ),
            ),
            bottomSheet: Container(
              height: 70,
              decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15))),
              child: Container(
                margin: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                        child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => BookingAppointment(state.doctorModel)));
                      },

                      child: Text(
                        AppLocalizations.of(context)!
                            .translate(AppString.bookingAppointment),
                        style:
                            TextStyle(color: AppColors.primary, fontSize: 16),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white),
                    )),
                    SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => MapSample(
                                    position: state.doctorModel.position!)));
                      },
                      child: Icon(
                        Icons.location_pin,
                        color: AppColors.primary,
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white),
                    )
                  ],
                ),
              ),
            ),
          );

        }
        return Container();
      }),
    );
  }

  appoitmentItem(String day, String start, String end) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            day,
            style: TextStyle(color: AppColors.primary, fontSize: 16),
          ),
          Container(
            padding: EdgeInsets.all(10),
            width: 100.w,
            decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20)),
            child: Text(
              start,
              style: TextStyle(color: AppColors.primary, fontSize: 16),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            width: 100.w,
            decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20)),
            child: Text(
              end,
              style: TextStyle(color: AppColors.primary, fontSize: 16),
            ),
          )
        ],
      ),
    );
  }
}
