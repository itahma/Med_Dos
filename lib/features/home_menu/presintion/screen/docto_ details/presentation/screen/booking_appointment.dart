import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:med_dos/core/local/app_local.dart';
import 'package:med_dos/core/utils/app_colors.dart';
import 'package:med_dos/core/utils/app_string.dart';
import 'package:med_dos/core/utils/app_text_style.dart';
import 'package:med_dos/core/utils/commons.dart';
import 'package:med_dos/core/widget/custom_cached_network_image.dart';
import 'package:med_dos/core/widget/custombutton.dart';
import 'package:med_dos/features/home_menu/presintion/screen/docto_%20details/presentation/cubit/doctor_cubit.dart';
import 'package:booking_calendar/booking_calendar.dart';
import 'package:med_dos/features/home_menu/presintion/screen/docto_%20details/presentation/screen/book_calender.dart';
import 'package:table_calendar/table_calendar.dart';

class BookingAppointment extends StatelessWidget {

  final scaffoldState = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    AppString.bookingAppointment.tr(context),
                    style: blueStyle(),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text(AppString.patient.tr(context)), Text(AppString.doctor.tr(context))]),
                ),
                Row(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            color: AppColors.primary.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(17)),
                        width: 70,
                        height: 100,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(AppString.me.tr(context)),
                              SizedBox(
                                height: 5,
                              ),
                              Icon(Icons.keyboard_arrow_up_sharp)
                            ],
                          ),
                        )),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        height: 100,
                        decoration: BoxDecoration(
                            color: AppColors.primary.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(17)),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: AppColors.primary.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(17),
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/icons/logo2.png"))),
                              width: 80,
                              height: 80,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text("Opada Aljondi")
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(),
                SizedBox(
                  height: 20,
                ),

                CustomButton(
                    onPressed: () {
Navigator.push(context, MaterialPageRoute(builder: (_)=>BookCalender()));
                    },
                    text: AppLocalizations.of(context)!
                        .translate(AppString.selectAppointment)),
                SizedBox(
                  height: 20,
                ),
                Divider(),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Tus 12:3 PM",
                        style: TextStyle(color: AppColors.primary),
                      ),
                      Text(AppLocalizations.of(context)!
                          .translate(AppString.bookSoonestAppointment),
                          style: TextStyle(color: AppColors.primary))
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(20),
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: AppColors.primary),
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                    title: Text(
                      AppLocalizations.of(context)!
                          .translate(AppString.alwaysAreminder),
                      style: TextStyle(fontSize: 15, color: AppColors.primary),
                    ),
                    trailing: Checkbox(
                      onChanged:
                      (g) {BlocProvider.of<DoctorCubit>(context).onChangeVal(g);},
                      value: BlocProvider.of<DoctorCubit>(context).valReminder,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomSheet: Padding(
          padding: EdgeInsets.all(10),
          child: CustomButton(
            onPressed: () {

            },
            text: AppLocalizations.of(context)!
                .translate(AppString.bookingAppointment),
          ),
        ),
      ),
    );
  }



}
