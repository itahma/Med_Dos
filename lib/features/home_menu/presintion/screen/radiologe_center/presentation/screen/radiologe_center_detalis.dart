import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:med_dos/core/database/api/end_points.dart';
import 'package:med_dos/core/local/app_local.dart';
import 'package:med_dos/core/utils/app_colors.dart';
import 'package:med_dos/core/utils/app_string.dart';
import 'package:med_dos/features/map/map.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;
import '../../../../../../../core/widget/custom_cached_network_image.dart';
import '../../data/model/radiologeModel.dart';

class RadiologyCenterItemDetails extends StatelessWidget {
  RadiologyModel radiologyModel;

  RadiologyCenterItemDetails({Key? key, required this.radiologyModel})
      : super(key: key);

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
                    child: CustomCachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: EndPoint.ImageUrl + radiologyModel.photo,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              Text(
                radiologyModel.name,
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
                    'Location',
                    style: TextStyle(
                      color: AppColors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>MapSample(position: radiologyModel.position)));
                  },
                  child: Container(
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
                          Text(radiologyModel.location.toString())
                        ],
                      )),
                ),
              ]),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Contract Info: ",
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
                        Uri uri =
                            Uri.parse('tel:${radiologyModel.phoneNumber}');
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
                        child: Padding(
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
                              Text(radiologyModel.phoneNumber,
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
                      "Time of Work: ",
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
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: Center(
                                child: Text(
                                    radiologyModel.firstDay,
                                    style: TextStyle(
                                      color: AppColors.black,
                                      fontSize: 15,
                                    )),
                              ),
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
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: Center(
                                child: Text(
    radiologyModel.lastDay ,
                                    style: TextStyle(
                                      color: AppColors.black,
                                      fontSize: 15,
                                    )),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
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
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: Center(
                                child: Text(
                                    radiologyModel.startWorking,
                                    style: TextStyle(
                                      color: AppColors.black,
                                      fontSize: 15,
                                    )),
                              ),
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
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: Center(
                                child: Text(
                                    radiologyModel.endWorking ,
                                    style: TextStyle(
                                      color: AppColors.black,
                                      fontSize: 15,
                                    )),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Divider(),
              SizedBox(height: 20,),
              Text("Radiology Types:"),
              SizedBox(height: 10,),
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
                  itemCount: radiologyModel.radiologyTypes.length,
                  itemBuilder: (context, index) {

                  return  Container(
                      decoration: BoxDecoration(
                          color: AppColors.primary.withOpacity(.8),
                          borderRadius: BorderRadius.circular(15)),
                      alignment: Alignment.center,
                      child: Center(
                        child: Text(radiologyModel.radiologyTypes[index],
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: AppColors.white,
                                )),
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
