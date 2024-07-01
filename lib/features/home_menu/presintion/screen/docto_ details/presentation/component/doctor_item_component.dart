import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:med_dos/core/database/api/end_points.dart';
import 'package:med_dos/core/routes/app_routes.dart';
import 'package:med_dos/core/utils/app_assets.dart';
import 'package:med_dos/core/utils/app_colors.dart';
import 'package:med_dos/core/utils/commons.dart';
import 'package:med_dos/core/widget/custom_cached_network_image.dart';
import 'package:med_dos/features/home_menu/presintion/screen/docto_%20details/data/model/doctor_model.dart';
import 'package:med_dos/features/home_menu/presintion/screen/docto_%20details/presentation/screen/doctor_details.dart';

class DoctorItemComponent extends StatelessWidget {
  DoctorModel doctorModel;
   DoctorItemComponent({Key? key,required this.doctorModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (_)=>DoctorDetails(doctorModel.id)));

      },
      child: Container(
        decoration: BoxDecoration(
            color: const Color(0xff91BAEF).withOpacity(.15),
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 5.0),
              child: SizedBox(
                  width: 65.w,
                  height: 65.h,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: CustomCachedNetworkImage(
                      fit: BoxFit.cover,
                        imageUrl:doctorModel.image!=null? (EndPoint.ImageUrl+doctorModel.image!):"https://th.bing.com/th/id/OIP.rzvJIIoK4rs7kpN44Q5YegHaE8?rs=1&pid=ImgDetMain",
                    ),
                  ),
                  //Image.asset(AppAssets.logoIm)\
                ),
            ),
            SizedBox(
              width: 8.w,
            ),
             Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(doctorModel.name,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                Text(doctorModel.specialist+(doctorModel.sub_specialist!=null?"/ ${doctorModel.sub_specialist}":""),style: TextStyle(fontSize: 14),),
               SizedBox(height: 5,),
                Text(doctorModel.location,style: TextStyle(fontSize: 12,color: Colors.grey),),
              ],
            ),
            const Spacer(),
            Column(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite_border),
                ),
                Padding(
                  padding: EdgeInsets.all(6),
                  child: Container(
                    height: 35.h,
                    width: 70.w,
                    decoration: BoxDecoration(
                        color: AppColors.primary.withOpacity(.9),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextButton(
                      onPressed: () {},
                      child: const Text('bocking',
                      style: TextStyle(color: Colors.white,
                      fontSize: 13,
                      ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
