import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:med_dos/core/utils/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({Key? key,
    required this.controller,
    this.hint,
    this.lable,
    this.validate,
     this.isPassword=false,
    this.icon,
    this.suffixIconOnPressed,
    this.hitColors,

  }) : super(key: key);
final TextEditingController controller;
final String? hint;
final String? lable;
final String? Function(String?)? validate;
final bool isPassword;
final IconData? icon;
final VoidCallback?suffixIconOnPressed;
  final Color? hitColors;



  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: AppColors.primary,
      obscureText: isPassword,
      validator: validate,
      decoration: InputDecoration(
        contentPadding:EdgeInsets.symmetric(horizontal: 16.w) ,
          hintText: hint,
          hintStyle: TextStyle(color:hitColors),

        labelText: lable,
        suffixIcon: IconButton(
          onPressed: suffixIconOnPressed,
          icon:Icon (
              icon,
          color: AppColors.primary,
          ),
        )


      ),


    );
  }
}
