import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:med_dos/core/local/app_local.dart';
import 'package:med_dos/core/routes/app_routes.dart';
import 'package:med_dos/core/utils/app_colors.dart';
import 'package:med_dos/core/utils/commons.dart';
import 'package:med_dos/core/utils/widget/app_string.dart';
import 'package:med_dos/features/auth/presentation/cubit/login/login_cubit/login_cubit.dart';
import 'package:med_dos/features/auth/presentation/cubit/registr_cubit/register_cubit.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

import '../../../../core/utils/widget/custombutton.dart';
class ProfileHome extends StatelessWidget {
  const ProfileHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Column(
            children: [
              Text('User Name',
                style: Theme.of(context).textTheme.displayLarge,),
              const SizedBox(height: 40,),
               Padding(
                 padding: const EdgeInsets.only(left: 15,right: 15),
                 child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        const Icon(Icons.cake,color:AppColors.primary,),
                        Text('23 سنة ',
                          style: TextStyle(color: Colors.blueAccent.shade100,fontSize: 17),
                        ),

                      ],
                    ),
                    const SizedBox(width: 40,),
                    Column(
                      children: [
                        const Icon(Icons.phone,color:AppColors.primary),
                        Text('+963987763535',
                          style: TextStyle(color: Colors.blueAccent.shade100,fontSize: 17),
                           ),


                      ],
                    ),
                    const SizedBox(width: 40,),
                    Column(
                      children: [
                        const Icon(Icons.male_outlined,color:AppColors.primary,),
                        Text('ذكر ',
                          style: TextStyle(color: Colors.blueAccent.shade100,fontSize: 17),
                        ),
                      ],
                    ),

                  ],

              ),
               ),
              Divider(height: 50,thickness:1,color: Colors.blue.shade50),
              Padding(
                padding: const EdgeInsets.all(10),
                child: GestureDetector(
                  onTap: () {
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xff91BAEF).withOpacity(.2),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    //Border.all
                    height: 55,
                    child:  Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.feed_outlined,
                            size: 25,
                            color: AppColors.primary,
                          ),
                          const SizedBox(width: 30),
                          Text(
                            AppString.medicalRecord.tr(context),
                            style: const TextStyle(color: AppColors.grey, fontSize: 18),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: GestureDetector(
                  onTap: () {
                    navigate(context: context, route: Routes.setting);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xff91BAEF).withOpacity(.2),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    //Border.all
                    height: 55,
                    child:  Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.settings,
                            size: 25,
                            color: AppColors.primary,
                          ),
                          const SizedBox(width: 30),
                          Text(
                            AppString.settings.tr(context),
                            style: const TextStyle(color: AppColors.grey, fontSize: 18),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: GestureDetector(
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
                    child:  Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.phone_outlined,
                            size: 25,
                            color: AppColors.primary,
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Text(AppString.support.tr(context),
                              style:
                              const TextStyle(color: AppColors.grey, fontSize: 18))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Divider(height: 50,thickness:1,color: Colors.blue.shade50),
              Padding(
                padding: const EdgeInsets.all(10),
                child: GestureDetector(
                  onTap: () {
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.red),
                      color:  Colors.red.withOpacity(.2),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    //Border.all
                    height: 55,
                    child:  Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.power_settings_new,
                            size: 25,
                            color: Colors.red,
                          ),
                          const SizedBox(width: 30),
                          Text(
                             AppString.logOut.tr(context),
                            style: const TextStyle(color: AppColors.grey, fontSize: 18),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              TextButton(onPressed: (){}
                  , child: Text(AppString.deleteAccount.tr(context),
                  style: const TextStyle(fontSize: 16,color:Colors.red),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
