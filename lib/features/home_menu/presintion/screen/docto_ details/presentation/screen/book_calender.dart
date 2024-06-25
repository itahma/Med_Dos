import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:med_dos/core/local/app_local.dart';
import 'package:med_dos/core/utils/app_colors.dart';
import 'package:med_dos/core/utils/app_string.dart';
import 'package:med_dos/core/utils/app_text_style.dart';
import 'package:med_dos/core/utils/commons.dart';
import 'package:med_dos/core/widget/custombutton.dart';
import 'package:table_calendar/table_calendar.dart';

class BookCalender extends StatefulWidget {
  @override
  State<BookCalender> createState() => _BookCalenderState();
}

class _BookCalenderState extends State<BookCalender>
    with TickerProviderStateMixin {
  var selectDay = DateTime.now();
  bool isSelected = false;
  final firsthour = 7;
  var timeSelect = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  "${selectDay.day} / ${selectDay.month}  ${AppLocalizations.of(context)!
                      .translate(AppString.availableTime)} :",
                  style: blueStyle(),
                )
              : Container(),
          SizedBox(
            height: 10,
          ),
          isSelected
              ? Expanded(
                  //padding: EdgeInsets.all(10),
                  child: ListView.builder(
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
                                              contentPadding: EdgeInsets.all(20),
                                                  buttonPadding: EdgeInsets.all(20),
                                                  elevation: 10,
                                                  title: Text(
                                                      "Booking appointment"),
                                                  content: Container(
                                                    padding: EdgeInsets.all(10),
                                                    child: Text("you are sure to confirm booking?"),

                                                  ),actions: [
                                                    ElevatedButton(onPressed: (){
                                                      //api handel
                                                      //8888888888888888888888888888888888888
                                                      //
                                                    }, child: Text("Yes"))
                                              ,ElevatedButton(onPressed: (){Navigator.of(context).pop();}, child: Text("No"))
                                            ],shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),

                                                )
                                        );
                                      },
                                      child: Container(
                                        width:90 ,
                                        padding: EdgeInsets.all(20),
                                        margin: EdgeInsets.only(left: 10),
                                        decoration: BoxDecoration(
                                          color: AppColors.primary,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Text(
                                          "Confirm",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    )
                                  : Container(),
                              timeSelect == i
                                  ?SizedBox(width: 10,):Container(),
                              Container(
                                width: timeSelect == i ? 100 : 200,
                                padding: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.withOpacity(0.3),
                                          blurRadius: 15,
                                          offset: Offset(3, 2))
                                    ]),
                                child: Text(" ${firsthour + i}:00 AM"),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: 5,
                  ),
                )
              : Container()
        ],
      ),
    ));
  }
}
