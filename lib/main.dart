import 'package:flutter/material.dart';
import 'package:kode_camp_task_four/login_screen.dart';
import 'package:kode_camp_task_four/profile_screen.dart';
import 'package:kode_camp_task_four/register_screen.dart';
import 'package:kode_camp_task_four/splash_screen.dart';
import 'package:kode_camp_task_four/the_main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      title: 'My first flutter app',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SplashScreen(),
        '/mainScreen': (context) => const TheMainScreen(),
        '/stateful': (context) => const ProfileScreen(),
        '/login': (context) => const LoginScreen(),
        '/RegisterScreen': (context) => const RegisterScreen(),
      },
    );
  }
}
