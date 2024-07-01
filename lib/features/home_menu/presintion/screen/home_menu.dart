import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:med_dos/core/local/app_local.dart';
import 'package:med_dos/core/routes/app_routes.dart';
import 'package:med_dos/core/utils/app_colors.dart';
import 'package:med_dos/core/utils/app_string.dart';
import 'package:med_dos/core/utils/commons.dart';
import 'package:med_dos/core/widget/customimage.dart';
import 'package:med_dos/features/home_menu/data/model/home_menu_model.dart';
import 'package:med_dos/features/home_menu/presintion/screen/docto_%20details/presentation/cubit/doctor_cubit.dart';
import 'package:med_dos/features/home_menu/presintion/screen/docto_%20details/presentation/screen/doctor_menu.dart';
import 'package:med_dos/features/home_menu/presintion/screen/search_screen.dart';

import '../../../../core/widget/custom_text_form_field.dart';


class MenuHomeScreen extends StatefulWidget {
  const MenuHomeScreen({Key? key}) : super(key: key);

  @override
  State<MenuHomeScreen> createState() => _MenuHomeScreenState();
}

class _MenuHomeScreenState extends State<MenuHomeScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppString.welcomeBack.tr(context),
                    style: TextStyle(fontSize: 25, color: Color(0xff063970)),
                  ),

                ],
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  AppString.howDoYouFeel.tr(context),
                  style: TextStyle(fontSize: 19, color: Color(0xff063970)),
                ),
              ),
              CustomTextFormField(
                controller: TextEditingController(),
                onTap: () {
                 navigate(context: context, route: Routes.searchScreen);
                },
                hint: AppString.whatAreYouLookingFor.tr(context),
                icon: Icons.search,
                keyboardType: TextInputType.text,
                validate: (data) {
                  if (data == null) {}
                },
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.primary,
                ),
                child: CarouselSlider(
                  carouselController: homeMenuController,
                  items: listHome.map((e) => buildBoardingItem(e)).toList(),
                  options: CarouselOptions(
                    height: 200.0,
                    autoPlay: true,
                    enableInfiniteScroll: true,
                    enlargeCenterPage: true,
                    onPageChanged: (index, _) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: listHome.asMap().entries.map((entry) {
                    int index = entry.key;
                    return Container(
                      width: index == currentIndex ? 25 : 15,
                      height: 15,
                      decoration: const BoxDecoration(
                        // border color
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(2), // border width
                        child: Container(
                          // or ClipRRect if you need to clip the content
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8.0)),
                            // shape:BoxShape.circle,
                            color: index == currentIndex
                                ? Colors.blue
                                : Colors.grey, // inner circle color
                          ),
                          child: Container(), // inner content
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              Divider(thickness: 2, color: Colors.blue.shade50),
              SizedBox(
                height: 100,
                // Provide a height constraint
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: (){Navigator.push(context, MaterialPageRoute(builder: (_)=>
                              DoctorMenu(sec:section[index].title),

                          ));},
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
              Divider(thickness: 2, color: Colors.blue.shade50),
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
                        if(index==0)
                        navigate(context: context, route: Routes.healthCentersMenu);
                        if(index==1)
                          navigate(context: context, route: Routes.laboratoriesMenu);
                        if(index==2)
                          navigate(context: context, route: Routes.radiologyCenterItemMenu);
                        if(index==3)
                          navigate(context: context, route: Routes.pharmaciesMenu);

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
            
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildBoardingItem(HomeMenuModel model) => CustomImage(
      fit: BoxFit.cover,
      imagePath: model.image,
    );
