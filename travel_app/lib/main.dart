import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarvel_app/core/storage/db_helper.dart';
import 'package:tarvel_app/core/style/app_theme.dart';
import 'package:tarvel_app/reponsive.dart';
import 'controller/home/home_cubit.dart';
import 'controller/nav_bar/nav_bar_cubit.dart';
import 'view/screens/strat_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DBHelper().db;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NavBarCubit()),
        BlocProvider(create: (context) => HomeCubit()),
      ],
      child: MaterialApp(
        title: 'Travel App',
        theme: AppTheme.lightTheme,
        home: const StartScreen(),
      ),
    );
  }
}
