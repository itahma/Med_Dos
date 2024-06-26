import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:med_dos/core/local/app_local.dart';
import 'package:med_dos/core/utils/app_colors.dart';
import 'package:med_dos/core/utils/app_string.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;
import '../../../../../../../core/widget/custom_cached_network_image.dart';

class PharmaciesDetails extends StatelessWidget {
  const PharmaciesDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppString.medDose,
              style: Theme.of(context).textTheme.displayMedium),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 16.h,
              ),
              Center(
                child: SizedBox(
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
              ),
              SizedBox(
                height: 25.h,
              ),
              Text(
                "صيدلية ميد دوز (تجريبي)",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(8),
                width: 160.w,
                decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Icon(Icons.check_circle, color: Colors.green),
                    SizedBox(height: 5),
                    Text(
                      AppLocalizations.of(context)!
                          .translate(AppString.availableNow),
                    ),
                  ],
                ),
              ),
              Divider(height: 30, thickness: 1, color: Colors.blue.shade50),
              SizedBox(height: 5),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'الموقع:',
                    style: TextStyle(
                      color: AppColors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                    padding: EdgeInsets.all(13),
                    width: double.infinity,
                    margin: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: AppColors.primary.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_pin,
                          color: AppColors.primary,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("دمشق, زاهرة, مركز الزاهرة الطبي")
                      ],
                    )),
              ]),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'معلومات التواصل :',
                      style: TextStyle(
                          color: AppColors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: InkWell(
                      onTap: () async {
                        Uri uri = Uri.parse('tel:+963-962-694065');
                        if (!await launcher.launchUrl(uri)) {
                          debugPrint("Could not launch the uri ");
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xff91BAEF).withOpacity(.2),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        //Border.all
                        height: 55,
                        child: const Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Icon(
                                Icons.phone_outlined,
                                size: 25,
                                color: AppColors.primary,
                              ),
                              SizedBox(
                                width: 18,
                              ),
                              Text('+963-962-694065 ',
                                  style: TextStyle(
                                      color: AppColors.grey, fontSize: 18))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'اوقات الدوام :',
                      style: TextStyle(
                          color: AppColors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xff91BAEF).withOpacity(.2),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            height: 65,
                            child: const Padding(
                              padding: EdgeInsets.all(8),
                              child: Text('من السبت الى الخميس  ',
                                  style: TextStyle(
                                    color: AppColors.black,
                                    fontSize: 15,
                                  )),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xff91BAEF).withOpacity(.2),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            height: 65,
                            child: const Padding(
                              padding: EdgeInsets.all(8),
                              child: Text('من الساعة التاسعة صباحا الى الخامسة مساء',
                                  style: TextStyle(
                                    color: AppColors.black,
                                    fontSize: 15,
                                  )),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),


            ],
          ),
        ),
      ),
    );
  }
}
