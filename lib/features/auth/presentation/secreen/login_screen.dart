import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:med_dos/core/local/app_local.dart';
import 'package:med_dos/core/utils/app_assets.dart';
import 'package:med_dos/core/utils/app_colors.dart';
import 'package:med_dos/core/utils/widget/app_string.dart';
import 'package:med_dos/core/utils/widget/custom_text_form_field.dart';
import 'package:med_dos/core/utils/widget/custombutton.dart';
import 'package:med_dos/core/utils/widget/customimage.dart';
import 'package:med_dos/features/auth/presentation/cubit/login/login_cubit.dart';
import 'package:med_dos/features/auth/presentation/cubit/login/login_state.dart';

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
                  Center(
                    child: Text(
                      AppString.welcomeBack.tr(context),
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40.h,
              ),
              Padding(
                padding: const EdgeInsets.all(24),
                child: BlocConsumer<LoginCubit, LoginState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    return Form(
                      key: BlocProvider.of<LoginCubit>(context).loginKey,
                      child: Column(
                        children: [
                          CustomTextFormField(
                            controller: BlocProvider.of<LoginCubit>(context)
                                .emailController,
                            hint: AppLocalizations.of(context)!
                                .translate(AppString.email),
                            hitColors: AppColors.grey,
                            validate: (data) {
                              if (data!.isEmpty ||
                                  !data.contains('@gmail.com')) {
                                return AppString.pleaseEnterValidEmail.tr(context);
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 32,
                          ),
                          CustomTextFormField(
                            controller: BlocProvider.of<LoginCubit>(context)
                                .passwordController,
                            hint: AppLocalizations.of(context)!
                                .translate(AppString.password),
                            hitColors: AppColors.grey,
                            isPassword: BlocProvider.of<LoginCubit>(context)
                                .isLoginPasswordShowing,
                            icon:
                                BlocProvider.of<LoginCubit>(context).suffixIcon,
                            suffixIconOnPressed: () {
                              BlocProvider.of<LoginCubit>(context)
                                  .changeLoginPasswordSuffixIcon();
                            },
                            validate: (data) {
                              if (data!.length < 6 || data.isEmpty) {
                                return AppString.pleaseEnterValidPassword.tr(context);
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 24.h,
                          ),
                          Row(
                            children: [
                              Text(
                                AppString.forgetPassword.tr(context),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 32.h,
                          ),
                          CustomButton(
                            onPressed: () {
                              if (BlocProvider.of<LoginCubit>(context)
                                  .loginKey
                                  .currentState!
                                  .validate()) {
                                print('Login');
                              }
                            },
                            text: AppString.signIn.tr(context),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
