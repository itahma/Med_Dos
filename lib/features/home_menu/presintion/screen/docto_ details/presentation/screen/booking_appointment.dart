import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:med_dos/core/database/api/end_points.dart';
import 'package:med_dos/core/local/app_local.dart';
import 'package:med_dos/core/utils/app_colors.dart';
import 'package:med_dos/core/utils/app_string.dart';
import 'package:med_dos/core/utils/app_text_style.dart';
import 'package:med_dos/core/utils/commons.dart';
import 'package:med_dos/core/widget/custom_cached_network_image.dart';
import 'package:med_dos/core/widget/custombutton.dart';
import 'package:med_dos/features/home_menu/presintion/screen/docto_%20details/data/model/doctor_model.dart';
import 'package:med_dos/features/home_menu/presintion/screen/docto_%20details/presentation/cubit/book_appointment/book_appointment_cubit.dart';
import 'package:med_dos/features/home_menu/presintion/screen/docto_%20details/presentation/cubit/book_soon_appointment/book_soon_appointment_cubit.dart';
import 'package:med_dos/features/home_menu/presintion/screen/docto_%20details/presentation/cubit/doctor_cubit.dart';
import 'package:booking_calendar/booking_calendar.dart';
import 'package:med_dos/features/home_menu/presintion/screen/docto_%20details/presentation/screen/book_calender.dart';
import 'package:table_calendar/table_calendar.dart';

class BookingAppointment extends StatefulWidget {
  DoctorModel doctorModel;

  BookingAppointment(this.doctorModel);

  @override
  State<BookingAppointment> createState() => _BookingAppointmentState();
}

class _BookingAppointmentState extends State<BookingAppointment> {
  final scaffoldState = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    BlocProvider.of<BookSoonAppointmentCubit>(context)
        .getSoonAppointment(widget.doctorModel.id);
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
        body: BlocConsumer<BookSoonAppointmentCubit, BookSoonAppointmentState>(
          listener: (_, st) {
            if(st is ErrorBookSoonAppointment){
              showToast(message: st.error, state: ToastState.error);
            }
            if(st is  SuccessBookSoonAppointment){
              showToast(message: st.message, state: ToastState.success);
            }
          },
          builder: (_, st) {
            return SingleChildScrollView(
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
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: AppColors.primary),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(AppString.patient.tr(context)),
                            Text(AppString.doctor.tr(context))
                          ]),
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
                                          image: NetworkImage(
                                              EndPoint.ImageUrl +
                                                  widget.doctorModel.image!))),
                                  width: 80,
                                  height: 80,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(widget.doctorModel.name)
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) =>
                                      BookCalender(id: widget.doctorModel.id)));
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
                      onPressed: () {
                        if(st is SuccessGetSoonAppointment){
                          BlocProvider.of<BookSoonAppointmentCubit>(context).bookSoonAppointment(widget.doctorModel.id,st.soonSlot.day,st.soonSlot.start);

                        }
                        BlocProvider.of<BookSoonAppointmentCubit>(context).getSoonAppointment(widget.doctorModel.id);
                        },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            st is SuccessGetSoonAppointment
                                ? (st.soonSlot.day + "  " + st.soonSlot.start)
                                : "",
                            style: TextStyle(color: AppColors.primary),
                          ),
                          Text(
                              AppLocalizations.of(context)!
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
                          style:
                              TextStyle(fontSize: 15, color: AppColors.primary),
                        ),
                        trailing: Checkbox(
                          onChanged: (g) {
                            BlocProvider.of<DoctorCubit>(context)
                                .onChangeVal(g);
                          },
                          value:
                              BlocProvider.of<DoctorCubit>(context).valReminder,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        bottomSheet: Padding(
          padding: EdgeInsets.all(10),
          child: CustomButton(
            onPressed: () {},
            text: AppLocalizations.of(context)!
                .translate(AppString.bookingAppointment),
          ),
        ),
      ),
    );
  }
}
