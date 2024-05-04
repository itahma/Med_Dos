import 'package:flutter/material.dart';
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

  }) : super(key: key);
final TextEditingController controller;
final String? hint;
final String? lable;
final String? Function(String?)? validate;
final bool isPassword;
final IconData? icon;
final VoidCallback?suffixIconOnPressed;



  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: AppColors.primary,
      obscureText: isPassword,
      validator: validate,
      decoration: InputDecoration(
          hintText: hint,
          suffixStyle: TextStyle(color: AppColors.primary ),
        labelText: lable,
        suffixIcon: IconButton(
          onPressed: suffixIconOnPressed,
          icon:Icon (icon),
        )


      ),


    );
  }
}
