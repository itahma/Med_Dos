

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:med_dos/core/local/app_local.dart';
import 'package:med_dos/core/utils/app_colors.dart';
import 'package:med_dos/core/utils/app_string.dart';
import 'package:med_dos/core/utils/app_text_style.dart';
import 'package:med_dos/core/utils/commons.dart';
import 'package:med_dos/core/widget/custombutton.dart';
import 'package:med_dos/features/home_menu/data/model/home_menu_model.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../../../core/routes/app_routes.dart';

class HealthCenterDetails extends StatelessWidget {
  const HealthCenterDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text(
          "HeathCenterName",
          style: Theme.of(context).textTheme.displayMedium,
        ),
        elevation: 0,
      ),
      body:Container(padding: EdgeInsets.all(10),
        child:SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: (){
               // Navigator.push(context, MaterialPageRoute(builder: (_)=>MapSample(h.p)));
              },
              child: Container(
                height:300,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/images/map.jpg"))
                ),
              ),
            ),
            SizedBox(height: 20,),
            Text("    ${AppString.sections.tr(context)}",style: blueStyle(),),
            SizedBox(height: 10,),
            SizedBox(
              height: 100,
              // Provide a height constraint
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: (){navigate(context: context, route: Routes.doctorMenu);},
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color(0xff91BAEF).withOpacity(.2),
                            borderRadius: BorderRadius.circular(15)),
                        width: 80,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            SvgPicture.asset(
                              height: 40.0.h,
                              width: 40.0.w,
                              allowDrawingOutsideViewBox: true,
                              section[index].icon,
                              color: AppColors.primary,
                              matchTextDirection: true,
                            ),
                            Text(
                              section[index].title.tr(context),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                itemCount: section.length,
                scrollDirection: Axis.horizontal,
              ),
            ),
            SizedBox(
              height: 200,
              child: GridView.builder(
                padding: const EdgeInsets.all(6),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 250,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  mainAxisExtent: 75,
                ),
                physics: const BouncingScrollPhysics(),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
                      navigate(context: context, route: Routes.healthCentersMenu);

                    },

                    child: Container(
                      decoration: BoxDecoration(
                          color: AppColors.primary.withOpacity(.8),
                          borderRadius: BorderRadius.circular(15)),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(listGrid[index].title.tr(context),
                              overflow:TextOverflow.ellipsis ,
                              style: const TextStyle(
                                color: AppColors.white,
                              )),
                          SvgPicture.asset(
                            height: 45.0.h,
                            width: 45.0.w,
                            allowDrawingOutsideViewBox: true,
                            listGrid[index].icon,
                            color: AppColors.white,
                            matchTextDirection: true,
                          ),

                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 10,),
            CustomButton(onPressed: (){
              launchUrl(Uri.parse("tel:00963909811"));
            }, text: "Phone")
          ],
         ),
        ),),
    );
  }
}
