import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:med_dos/core/utils/app_colors.dart';
import 'package:med_dos/core/utils/app_string.dart';
import 'package:med_dos/core/utils/commons.dart';
import 'package:med_dos/core/widget/custom_text_form_field.dart';
import 'package:med_dos/features/booking/data/Model/booking.dart';
import 'package:med_dos/features/booking/presentation/cubit/booking_cubit.dart';

class BookingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            AppString.medDose,
            style: Theme.of(context).textTheme.displayMedium,
          ),
          leading: IconButton(
              onPressed: () {}, icon: const Icon(Icons.notifications)),
          elevation: 0,
        ),
        body:  RefreshIndicator(
            onRefresh: ()async{
              BlocProvider.of<BookingCubit>(context).getMyBooking();
            },
            
          child: BlocConsumer<BookingCubit, BookingState>(listener: (_, state) {
            if (state is ErrorBooking) {
              showToast(message: state.error, state: ToastState.error);
            }
            if (state is ErrorCancelBooking) {
              showToast(message: state.error, state: ToastState.error);
            }
            if (state is SuccessCancelBooking) {
              showToast(message: state.message, state: ToastState.success);
            }
          }, builder: (_, state) {
            if (state is LoadingBooking) {
              return Container(
                child: Center(
                  child: SpinKitFadingCircle(
                    color: AppColors.primary,
                  ),
                ),
              );
            }
            if (state is LoadedBooking) {
              return ListView.builder(
                itemCount: state.bookingState.length,
                itemBuilder: (context, index) {
                  Booking booking = state.bookingState[index];
                  return Card(
                    shadowColor: Colors.grey,
                    margin: EdgeInsets.all(8.0),
                    child: Container(
                      padding: EdgeInsets.all(8),
                      child: ListTile(
                        title: Text(booking.doctorName),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Date : ${booking.date}'),
                            Text('Time :${booking.start}  to  ${booking.end}'),
                          ],
                        ),
                        trailing: InkWell(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (_) => AlertDialog(
                                      contentPadding: EdgeInsets.all(20),
                                      buttonPadding: EdgeInsets.all(20),

                                      elevation: 10,

                                      title: Text("Cancel Booking",style: TextStyle(color: Colors.red),),
                                      content: Container(
                                        height: 100,
                                        child: Column(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(10),
                                              child: Text(
                                                  "What is the reason for the cancellation ?"),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              padding:
                                                  EdgeInsets.symmetric(horizontal: 8),
                                              child: CustomTextFormField(
                                                controller: TextEditingController(),
                                                hint: "Reason",
                                                hitColors: AppColors.grey,

                                                validate: (data) {
                                                  if (data!.isEmpty ||
                                                      data.length > 13) {}
                                                  return null;
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      actions: [
                                        ElevatedButton(
                                          onPressed: () {
                                            BlocProvider.of<BookingCubit>(context).cancleBooking(booking.id);
                                            BlocProvider.of<BookingCubit>(context).getMyBooking();
                                            Navigator.of(context).pop();
                                          },
                                          child: Text("Confirm"),
                                        ),
                                      ],
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20)),
                                    ));
                          },
                          child: Container(
                            height: 30,
                            width: 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.red),
                            child: Center(
                              child: Text(
                                "Cancel",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        onTap: () {
                          // Handle on tap if needed
                        },
                      ),
                    ),
                  );
                },
              );
            }
            return Container();
          }),
        ));
  }
}
