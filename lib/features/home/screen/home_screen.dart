import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:med_dos/core/local/app_local.dart';
import 'package:med_dos/core/utils/app_colors.dart';
import 'package:med_dos/features/home/component/gnav_component.dart';
import 'package:med_dos/features/home/cubit/home_cubit.dart';
import 'package:med_dos/features/home/cubit/home_state.dart';

import '../../../core/utils/app_string.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(AppString.medDose,style: Theme.of(context).textTheme.displayMedium,) ,
            leading: IconButton(onPressed: (){},icon: const Icon(Icons.notifications)),
            elevation: 0,

          ),
          body:  BlocProvider.of<HomeCubit>(context).screens[ BlocProvider.of<HomeCubit>(context).currentIndex],
          bottomNavigationBar:const GNavComponent(),
        );
      },
    );
  }
}
