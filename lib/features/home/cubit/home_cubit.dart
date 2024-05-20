

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:med_dos/features/articles/screen/Articles_screen.dart';
import 'package:med_dos/features/favorite/screen/Favorite_screen.dart';
import 'package:med_dos/features/help/screen/help_screen.dart';
import 'package:med_dos/features/home_menu/screen/home_menu.dart';
import 'package:med_dos/features/profile/presentation/secreen/profile_home_screen.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  List<Widget> screens=[
    const HelpScreen(),
    const ArticlesScreen(),
    const  MenuHomeScreen(),
    const FavoriteScreen(),
    const ProfileHome(),


  ];
  int currentIndex=2;
   changeIndex(index){
    currentIndex=index;
    emit(ChangeIndexstate());
  }

}
