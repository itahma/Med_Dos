import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:med_dos/core/local/app_local.dart';
import 'package:med_dos/core/utils/app_assets.dart';
import 'package:med_dos/core/utils/widget/app_string.dart';

class HomeSection{
   final String title ;
   final String icon;
   HomeSection({
     required this.icon,
     required this.title
   });
}

final List<HomeSection>section=[
  HomeSection(icon: AppAssets.heart1,title: AppString.cardiology),//قلبية
  HomeSection(icon: AppAssets.bodyUpper,title: AppString.dermatology),//جلدية
  HomeSection(icon: AppAssets.brain,title:  AppString.neurology),//عصبية
  HomeSection(icon: AppAssets.baby,title: AppString.pediatrics),//اطفال
  HomeSection(icon: AppAssets.female,title: AppString.gynecology),//نسائية
  HomeSection(icon: AppAssets.eye,title: AppString.ophthalmology),//عينية
  HomeSection(icon: AppAssets.tooth,title: AppString.dentist),//اسنان
  HomeSection(icon: AppAssets.ear,title: AppString.otolaryngologist),//انف اذن حنجرة
  HomeSection(icon: AppAssets.stomach,title: AppString. gastroenterologist),//هضمية
  HomeSection(icon: AppAssets.first,title:AppString. generalSurgery),//جراحة عامة
  HomeSection(icon: AppAssets.first,title: AppString.hematology),//دم
  HomeSection(icon: AppAssets.ball,title: AppString.orthopedics),//عظمية
  HomeSection(icon: AppAssets.male_head,title:AppString. psychiatry),//نفسي
  HomeSection(icon: AppAssets.excretory,title: AppString.nephrology),//كلى
  HomeSection(icon: AppAssets.first,title: AppString.oncology),//طب الاورام

];
final List<HomeSection>listGrid=[
  HomeSection(icon: AppAssets.building,title: AppString.healthCenters),
  HomeSection(icon: AppAssets.microscope,title: AppString.laboratories),
  HomeSection(icon: AppAssets.hand,title: AppString.radiologyCenters),
  HomeSection(icon: AppAssets.capsule,title: AppString.pharmacies),
];

class HomeMenuModel {
  final String image;

  HomeMenuModel({
    required this.image,
  });
}
CarouselController homeMenuController = CarouselController();
late List<HomeMenuModel> listHome = [
  HomeMenuModel(image: AppAssets.onBoarding1),
  HomeMenuModel(image: AppAssets.onBoarding2),
  HomeMenuModel(image: AppAssets.onBoarding3),
  HomeMenuModel(image: AppAssets.onBoarding4),
];
int currentIndex = 0;