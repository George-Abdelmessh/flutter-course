import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarvel_app/controller/nav_bar/nav_bar_state.dart';

import '../../view/screens/fav_screen.dart';
import '../../view/screens/home_screen_content.dart';

class NavBarCubit extends Cubit<NavBarState> {
  NavBarCubit():super(NavBarInitStata());
  
  static NavBarCubit get(BuildContext context) => BlocProvider.of(context);

  int currentIndex = 0;
  
  List<Widget> screens = [
    const HomeScreenContent(),
    const FavScreen(),
    const Center(
      child: Text('Settings'),
    ),
    const Center(
      child: Text('Search'),
    ),
  ];

  void changeNavBarIndex(int index) {
    currentIndex = index;
    emit(ChangeNavBarStata());
  }
}