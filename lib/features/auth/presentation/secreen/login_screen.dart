import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:med_dos/core/local/app_local.dart';
import 'package:med_dos/core/utils/app_assets.dart';
import 'package:med_dos/core/utils/app_colors.dart';
import 'package:med_dos/core/utils/widget/app_string.dart';
import 'package:med_dos/core/utils/widget/custom_text_form_field.dart';
import 'package:med_dos/core/utils/widget/custombutton.dart';
import 'package:med_dos/core/utils/widget/customimage.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  const CustomImage(
                    imagePath: AppAssets.loginImage,
                    w: double.infinity,
                  ),
                  Center(child: Text(AppString.welcomeBack.tr(context),
                  style: Theme.of(context).textTheme.displayLarge,
                  ),

                  ),

                ],
              ),
              SizedBox(height: 40.h,),
              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                      CustomTextFormField(
                        controller: TextEditingController(),
                        hint: AppString.email.tr(context),


                      ),
                    SizedBox(height: 32,),
                    CustomTextFormField(
                      controller: TextEditingController(),
                    hint:AppString.password.tr(context),
                      isPassword: true,
                      icon: Icons.remove_red_eye,
                      suffixIconOnPressed: (){

                      },
                      validate: (data){
                        if(data!.length<6||data.isEmpty){
                          return AppString.pleaseEnterValidPassword;
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 24.h,),
                    Row(
                      children: [
                        Text(AppString.forgetPassword.tr(context),),
                      ],
                    ),
                    SizedBox(height: 32.h,),
                    CustomButton(
                        onPressed: (){},
                        text:AppString.signIn.tr(context), ),

                  ],
                ),
              )
            ],
          ),
        ),
      ),

    );
  }
}
