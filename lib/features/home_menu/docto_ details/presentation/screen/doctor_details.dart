import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:med_dos/core/utils/app_assets.dart';
import 'package:med_dos/core/utils/app_colors.dart';

import '../../../../../core/widget/custom_cached_network_image.dart';

class DoctorDetails extends StatelessWidget {
  const DoctorDetails({Key? key}) : super(key: key);

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
                        'أحمد الجاسم',
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Icon(Icons.timer, color: Colors.blue),
                        SizedBox(height: 5),
                        Text('المعاينة 15 دقيقة'),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.check_circle, color: Colors.green),
                        SizedBox(height: 5),
                        Text('متوفر الآن'),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        // body: SingleChildScrollView(
        //   child: Column(
        //
        //     children: [
        //       Row(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: [
        //           Padding(
        //             padding: const EdgeInsets.all( 8),
        //             child: Center(
        //               child: SizedBox(
        //                 width: 120.w,
        //                 height: 120.h,
        //                 child: ClipRRect(
        //                   borderRadius: BorderRadius.circular(15),
        //                   child:const CustomCachedNetworkImage(
        //                     fit: BoxFit.cover,
        //                     imageUrl: "https://th.bing.com/th/id/OIP.rzvJIIoK4rs7kpN44Q5YegHaE8?rs=1&pid=ImgDetMain",
        //                   ),
        //                 ),
        //                 //Image.asset(AppAssets.logoIm)\
        //               ),
        //             ),
        //           ),
        //
        //           Padding(
        //             padding: const EdgeInsets.all(8.0),
        //             child: Container(
        //                 height: 50.h,
        //                 width: 50.w,
        //                 decoration: BoxDecoration(
        //                     color: const Color(0xff91BAEF).withOpacity(.3),
        //                     borderRadius: BorderRadius.circular(10)),
        //                 child: Center(child: IconButton(icon:const Icon( Icons.favorite_border),onPressed: (){},))
        //             ),
        //           ),
        //         ],
        //       ),
        //
        //
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
