import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:med_dos/core/local/app_local.dart';
import 'package:med_dos/core/routes/app_routes.dart';
import 'package:med_dos/core/utils/app_assets.dart';
import 'package:med_dos/core/utils/app_colors.dart';
import 'package:med_dos/core/utils/app_text_style.dart';
import 'package:med_dos/core/utils/commons.dart';
import 'package:med_dos/features/home_menu/presintion/screen/docto_%20details/data/model/Appointment.dart';
import 'package:med_dos/features/home_menu/presintion/screen/docto_%20details/presentation/cubit/doctor_cubit.dart';

import '../../../../../../../core/utils/app_string.dart';
import '../../../../../../../core/widget/custom_cached_network_image.dart';

class DoctorDetails extends StatelessWidget {
  List<Appointment> appoitment = [
    Appointment(day: "الثلاثاء", start: "8:00 صباحا ", end: "7:00 مساء"),
    Appointment(day: "الاربعاء", start: "8:00 صباحا ", end: "9:00 مساء"),
    Appointment(day: "الخميس", start: "8:50 صباحا ", end: "6:00 مساء")
  ];

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
        body: BlocConsumer<DoctorCubit, DoctorState>(
          listener: (ctx, state) {},
          builder: (ctx, state) => SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: IconButton(
                      icon: BlocProvider.of<DoctorCubit>(context).isLike
                          ? Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )
                          : Icon(Icons.favorite_border),
                      onPressed: BlocProvider.of<DoctorCubit>(context).Like,
                    ),
                  ),
                  Center(
                    child: Column(
                      children: [
                        SizedBox(
                          width: 150.w,
                          height: 150.h,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: const CustomCachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl:
                                  "https://th.bing.com/th/id/OIP.rzvJIIoK4rs7kpN44Q5YegHaE8?rs=1&pid=ImgDetMain",
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Opada Aljondi",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'قلبية',
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
                                '${AppLocalizations.of(context)!.translate(AppString.preview)} 15 ${AppLocalizations.of(context)!.translate(AppString.min)}'),
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
                        Text(
                            "أخصائي في امراض القلب , حاصل على البورد السوري في امراض القلب و الاوعية الدموية حاصل على شهادة اكسفورد في معالجة الامرض السارية")
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
                          Text("دمشق, زاهرة, مركز الزاهرة الطبي")
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
                          Appointment ap = appoitment[i];
                          return appoitmentItem(ap.day, ap.start, ap.end);
                        },
                        itemCount: appoitment.length,
                      )),
                  SizedBox(
                    height: 70,
                  )
                ],
              ),
            ),
          ),
        ),
        bottomSheet: Container(
          height: 70,
          decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15))),
          child: Container(
            margin: EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                    child: ElevatedButton(
                  onPressed: () {
                    navigate(
                        context: context, route: Routes.bookingAppointment);
                  },
                  child: Text(
                    AppLocalizations.of(context)!
                        .translate(AppString.bookingAppointment),
                    style: TextStyle(color: AppColors.primary, fontSize: 16),
                  ),
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.white),
                )),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.location_pin,
                    color: AppColors.primary,
                  ),
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.white),
                )
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
