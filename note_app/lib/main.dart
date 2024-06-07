import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/controller/auth/auth_cubit.dart';
import 'package:note_app/core/storage/cache_manager.dart';
import 'package:note_app/core/storage/db_helper.dart';
import 'package:note_app/view/screens/notes_screen.dart';

import 'controller/notes/notes_cubit.dart';
import 'view/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Initialize DataBase
  await DBHelper().db;

  /// Initialize Caching
  await CacheManager.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => NotesCubit()),
      ],
      child: MaterialApp(
        theme: ThemeData(useMaterial3: false),
        title: 'Note App',
        debugShowCheckedModeBanner: false,
        home: CacheManager.getDate(key: 'id') != null?
        const NotesScreen() :  const HomeScreen(),
      ),
    );
  }
}
