import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:med_dos/core/local/app_local.dart';
import 'package:med_dos/core/utils/app_colors.dart';
import 'package:med_dos/core/utils/app_string.dart';
import 'package:med_dos/core/utils/app_text_style.dart';
import 'package:med_dos/core/utils/commons.dart';
import 'package:med_dos/core/widget/custombutton.dart';
import 'package:med_dos/features/home_menu/presintion/screen/docto_%20details/presentation/cubit/book_appointment/book_appointment_cubit.dart';
import 'package:table_calendar/table_calendar.dart';

class BookCalender extends StatefulWidget {
  String id;

  BookCalender({required this.id});

  @override
  State<BookCalender> createState() => _BookCalenderState();
}

class _BookCalenderState extends State<BookCalender>
    with TickerProviderStateMixin {
  var selectDay = DateTime.now();
  bool isSelected = false;
  final firsthour = 7;
  var timeSelect = -1;
  late String s;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookAppointmentCubit, BookAppointmentState>(
        listener: (_, state) {
      if (state is ErrorBookAppointment) {
        showToast(message: state.error, state: ToastState.error);
      }
      if (state is SuccessBookAppointment) {
        showToast(message: state.message, state: ToastState.success);
      }
    }, builder: (_, state) {
      return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text(
                AppString.medDose,
                style: Theme.of(context).textTheme.displayMedium,
              ),
              elevation: 0,
            ),
            body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: TableCalendar(
                  onDaySelected: (d, f) {
                    setState(() {
                      isSelected = true;
                      selectDay = d;
                      s = "${d.year}-0${d.month}-${d.day}";
                      BlocProvider.of<BookAppointmentCubit>(context)
                          .getSlots(widget.id, s);
                    });
                  },
                  selectedDayPredicate: (d) {
                    if (d == selectDay) return true;
                    return false;
                  },
                  lastDay: DateTime.utc(2027, 1, 1),
                  focusedDay: selectDay,
                  firstDay: DateTime.now(),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(),
              SizedBox(
                height: 10,
              ),
              isSelected
                  ? Text(
                      "${selectDay.day} / ${selectDay.month}  ${AppLocalizations.of(context)!.translate(AppString.availableTime)} :",
                      style: blueStyle(),
                    )
                  : Container(),
              SizedBox(
                height: 10,
              ),
              isSelected
                  ? Expanded(
                      child: state is LoadedSlote
                          ? ListView.builder(
                              itemBuilder: (_, i) {
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      timeSelect = i;
                                    });
                                  },
                                  child: Container(
                                    width: 200,
                                    margin: EdgeInsets.all(20),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        timeSelect == i
                                            ? InkWell(
                                                onTap: () {
                                                  showDialog(
                                                      context: context,
                                                      builder: (_) => AlertDialog(
                                                            contentPadding:
                                                                EdgeInsets.all(
                                                                    20),
                                                            buttonPadding:
                                                                EdgeInsets.all(
                                                                    20),
                                                            elevation: 10,
                                                            title: Text(
                                                                "Booking appointment"),
                                                            content: Container(
                                                              padding:
                                                                  EdgeInsets.all(
                                                                      10),
                                                              child: Text(
                                                                  "you are sure to confirm booking? "),
                                                            ),
                                                            actions: [
                                                              ElevatedButton(
                                                                onPressed: () {
                                                                  BlocProvider.of<
                                                                              BookAppointmentCubit>(
                                                                          context)
                                                                      .bookAppointment(
                                                                          widget
                                                                              .id,
                                                                          s,
                                                                          state
                                                                              .slots[i]
                                                                              .start);
                                                                  BlocProvider.of<BookAppointmentCubit>(context)
                                                                      .getSlots(widget.id, s);
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                },
                                                                child:
                                                                    Text("Yes"),
                                                              ),
                                                              ElevatedButton(
                                                                  onPressed: () {
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop();
                                                                  },
                                                                  child:
                                                                      Text("No"))
                                                            ],
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20)),
                                                          ));
                                                },
                                                child: Container(
                                                  width: 90,
                                                  padding: EdgeInsets.all(20),
                                                  margin:
                                                      EdgeInsets.only(left: 10),
                                                  decoration: BoxDecoration(
                                                    color: AppColors.primary,
                                                    borderRadius:
                                                        BorderRadius.circular(10),
                                                  ),
                                                  child: Text(
                                                    "Confirm",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              )
                                            : Container(),
                                        timeSelect == i
                                            ? SizedBox(
                                                width: 10,
                                              )
                                            : Container(),
                                        Container(
                                          width: timeSelect == i ? 100 : 200,
                                          padding: EdgeInsets.all(20),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.3),
                                                    blurRadius: 15,
                                                    offset: Offset(3, 2))
                                              ]),
                                          child:
                                              Text(" ${state.slots[i].start} AM"),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              itemCount: state.slots.length,
                            )
                          : Container(
                              child: Center(
                                child: Text("No Time Availble"),
                              ),
                            ),
                    )
                  : Container(),
            ],
          ),
        )),
      );
    });
  }
}
