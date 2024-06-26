
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:med_dos/core/utils/app_colors.dart';
import 'package:med_dos/core/widget/custom_cached_network_image.dart';
import '../../../../../../../core/routes/app_routes.dart';
import '../../../../../../../core/utils/commons.dart';

class RadiologyCenterItemComponent extends StatelessWidget {
  const RadiologyCenterItemComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        navigate(context: context, route: Routes.radiologyCenterItemDetails);

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
                  child:const CustomCachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: "https://th.bing.com/th/id/OIP.rzvJIIoK4rs7kpN44Q5YegHaE8?rs=1&pid=ImgDetMain",
                  ),
                ),
                //Image.asset(AppAssets.logoIm)\
              ),
            ),
            SizedBox(
              width: 8.w,
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Name RadiologyCenter',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Text('Location',style: TextStyle(fontSize: 12),),
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
                  child: const Text('متوفر الان',
                    style: TextStyle(color:AppColors.primary,
                      fontSize: 13,
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
