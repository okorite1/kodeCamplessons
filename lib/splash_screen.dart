import 'package:flutter/material.dart';
import 'package:kode_camp_task_four/login_screen.dart';
//import 'profile_screen.dart';

void main() {
  //
  runApp(SplashScreen());
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) {
        return;
      }
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 100,
                backgroundColor: Colors.teal,
                child: Image.network(
                  'https://static.vecteezy.com/system/resources/thumbnails/052/793/073/small/chef-logo-design-vector.jpg',
                  width: 100,
                  height: 100,
                  fit: BoxFit.fill,
                ),
              ),

              SizedBox(height: 16),
              Text(
                'MR COOK',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
