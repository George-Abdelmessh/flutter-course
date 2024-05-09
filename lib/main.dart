import 'package:app1/controller/password_visibilty_controller.dart';
import 'package:app1/controller/todo_controller.dart';
import 'package:app1/core/storage/cache_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controller/counter_controller.dart';
import 'view/screens/todo_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  CacheManager.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CounterController()),
        ChangeNotifierProvider(create: (context) => PasswordVisibilityController()),
        ChangeNotifierProvider(create: (context) => ToDoListController()),
      ],
      child: const MaterialApp(
        home: ToDoScreen(),
        // initialRoute: '/',
        // routes: {
        //   '/': (context) => const LoginScreen(),
        //   '/signup': (context) => const SignUpScreen(),
        //   '/counter': (context) => const CounterPage(),
        // },
      ),
    );
  }
}
