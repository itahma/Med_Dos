import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:med_dos/core/local/app_local.dart';
import 'package:med_dos/core/utils/app_colors.dart';
import 'package:med_dos/core/utils/app_string.dart';
import 'package:med_dos/features/booking/presentation/cubit/booking_cubit.dart';
import 'package:med_dos/features/booking/presentation/screeen/my_booking.dart';
import 'package:med_dos/features/home/presentation/component/gnav_component.dart';
import 'package:med_dos/features/home/presentation/cubit/home_cubit.dart';
import 'package:med_dos/features/home/presentation/cubit/home_state.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(AppString.medDose,style: Theme.of(context).textTheme.displayMedium,) ,
            leading: IconButton(onPressed: (){},icon: const Icon(Icons.notifications)),
            elevation: 0,

          ),
          body:  BlocProvider.of<HomeCubit>(context).screens[ BlocProvider.of<HomeCubit>(context).currentIndex],
          bottomNavigationBar:const GNavComponent(),
          drawer: Drawer(
            child: Container(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  SizedBox(height: 100,),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15)
                          ,color: Colors.white
                        ,boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.3),offset: Offset(2,3),blurRadius: 15)]
                    ),
                    child: ListTile(leading: Icon(Icons.access_time_filled),title: Text("My Booking"),onTap: (){
Navigator.push(context, MaterialPageRoute(builder: (_)=>BookingScreen()));
                    },),
                  )
                ],

              ),
            ),
          ),
        );
      },
    );
  }
}
