import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:med_dos/core/database/api/end_points.dart';
import 'package:med_dos/core/utils/app_colors.dart';
import 'package:med_dos/core/widget/custom_cached_network_image.dart';
import 'package:med_dos/features/home_menu/presintion/screen/radiologe_center/data/model/radiologeModel.dart';
import 'package:med_dos/features/home_menu/presintion/screen/radiologe_center/presentation/screen/radiologe_center_detalis.dart';
import '../../../../../../../core/routes/app_routes.dart';
import '../../../../../../../core/utils/commons.dart';

class RadiologyCenterItemComponent extends StatelessWidget {
  RadiologyModel radiologyModel;

  RadiologyCenterItemComponent({Key? key, required this.radiologyModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => RadiologyCenterItemDetails(
                    radiologyModel: radiologyModel)));
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
                    imageUrl: EndPoint.ImageUrl + radiologyModel.photo!,
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
                Text(
                  radiologyModel.name,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  radiologyModel.location,
                  style: TextStyle(fontSize: 12),
                ),
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
                  child: const Text(
                    'متوفر الان',
                    style: TextStyle(
                      color: AppColors.primary,
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
