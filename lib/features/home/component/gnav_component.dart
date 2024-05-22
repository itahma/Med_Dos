import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:med_dos/core/local/app_local.dart';
import 'package:med_dos/core/utils/app_colors.dart';

import '../../../core/utils/app_string.dart';
import '../cubit/home_cubit.dart';

class GNavComponent extends StatelessWidget {
  const GNavComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      index:BlocProvider.of<HomeCubit>(context).currentIndex,

      backgroundColor: AppColors.primary,

      items: [

        CurvedNavigationBarItem(
          labelStyle: const TextStyle(color: AppColors.primary),
          child: const Icon(Icons.help_outline),
          label:AppString.help.tr(context),
        ),
        CurvedNavigationBarItem(
          labelStyle: const TextStyle(color: AppColors.primary),
          child: const Icon(Icons.article_outlined, ),
          label: AppString.article.tr(context),
        ),
        CurvedNavigationBarItem(
          labelStyle: const TextStyle(color: AppColors.primary),
          child: const Icon(Icons.home_outlined),
          label: AppString.home.tr(context),
        ),
        CurvedNavigationBarItem(
          labelStyle: const TextStyle(color: AppColors.primary),
          child: const Icon(Icons.favorite_border),
          label: AppString.favorite.tr(context),
        ),
        CurvedNavigationBarItem(
          labelStyle: const TextStyle(color: AppColors.primary),
          child: const Icon(Icons.person_2_outlined),
          label: AppString.profile.tr(context),
        ),
      ],
      onTap: (value) {
        BlocProvider.of<HomeCubit>(context).changeIndex(value);

      },
    );
  }
}
