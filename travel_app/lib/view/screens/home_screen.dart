import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarvel_app/controller/nav_bar/nav_bar_cubit.dart';
import 'package:tarvel_app/controller/nav_bar/nav_bar_state.dart';
import 'package:tarvel_app/core/style/app_colors.dart';

import '../../controller/home/home_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    HomeCubit.get(context).getAllData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BlocBuilder<NavBarCubit, NavBarState>(
        builder: (context, state) {
          return BottomNavigationBar(
            selectedItemColor: AppColors.blue,
            currentIndex: NavBarCubit.get(context).currentIndex,
            unselectedItemColor: AppColors.darkGrey,
            onTap: (index) => NavBarCubit.get(context).changeNavBarIndex(index),
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
            ],
          );
        },
      ),
      body: BlocBuilder<NavBarCubit, NavBarState>(
        builder: (context, state) {
          return SafeArea(
            child: NavBarCubit.get(context)
                .screens[NavBarCubit.get(context).currentIndex],
          );
        },
      ),
    );
  }
}
