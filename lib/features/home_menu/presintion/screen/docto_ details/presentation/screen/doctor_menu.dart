import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:med_dos/core/utils/app_colors.dart';

import '../../../../../../../core/utils/app_string.dart';
import '../component/doctor_item_component.dart';

class DoctorMenu extends StatelessWidget {
  const DoctorMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text(AppString.medDose,style: Theme.of(context).textTheme.displayMedium,) ,

            elevation: 0,

          ),
          body: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Center(
                        child: Text('specialization',
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
                          color: const Color(0xff91BAEF).withOpacity(.3),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(child: IconButton(icon:const Icon( Icons.search_off_rounded),onPressed: (){},))
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) => const Padding(
                        padding: EdgeInsets.all(8),
                        child: DoctorItemComponent()),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
