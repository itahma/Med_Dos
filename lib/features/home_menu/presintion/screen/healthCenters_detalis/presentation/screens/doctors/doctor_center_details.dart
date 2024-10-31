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
import 'package:med_dos/core/utils/app_string.dart';
import 'package:med_dos/core/utils/app_text_style.dart';
import 'package:med_dos/core/utils/commons.dart';
import 'package:med_dos/core/widget/custom_cached_network_image.dart';
import 'package:med_dos/features/home_menu/presintion/screen/docto_%20details/data/model/Appointment.dart';
import 'package:med_dos/features/home_menu/presintion/screen/docto_%20details/presentation/cubit/doctor_cubit.dart';
import 'package:med_dos/features/home_menu/presintion/screen/docto_%20details/presentation/screen/booking_appointment.dart';
import 'package:med_dos/features/home_menu/presintion/screen/healthCenters_detalis/data/Model/doctor_center.dart';
import 'package:med_dos/features/home_menu/presintion/screen/healthCenters_detalis/presentation/cubit/doctor_center_cubit/doctor_center_cubit.dart';
import 'package:med_dos/features/map/map.dart';
import 'package:med_dos/features/myConsultations/presentation/screen/medicalConsultation_screen.dart';

class DoctorCenterDetails extends StatefulWidget {
  DoctorCenterModel doctorCenterModel;

  DoctorCenterDetails(this.doctorCenterModel);

  @override
  State<DoctorCenterDetails> createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorCenterDetails> {
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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(

                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: 150.w,
                          height: 150.h,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: CustomCachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl: widget.doctorCenterModel.image != null
                                  ? EndPoint.ImageUrl +
                                      widget.doctorCenterModel.image!
                                  : "https://th.bing.com/th/id/OIP.rzvJIIoK4rs7kpN44Q5YegHaE8?rs=1&pid=ImgDetMain",
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          widget.doctorCenterModel.name,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          widget.doctorCenterModel.specialist,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Divider(
                  color: AppColors.primary.withOpacity(0.1),
                ),
                Text(
                  AppLocalizations.of(context)!.translate(AppString.timeOfWork),
                  style: blueStyle(),
                ),
                Container(
                    height: 300,
                    width: double.infinity,
                    child: ListView.builder(
                      itemBuilder: (_, i) {
                        return appoitmentItem(
                            widget.doctorCenterModel.workingDays![i].day,
                            widget.doctorCenterModel.workingDays![i].start,
                            widget.doctorCenterModel.workingDays![i].end);
                      },
                      itemCount: widget.doctorCenterModel.workingDays.length,
                    )),
              ],
            ),
          ),
        ),
      ),
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
