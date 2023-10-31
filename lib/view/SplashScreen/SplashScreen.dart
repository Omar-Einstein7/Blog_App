import 'package:blog_viewer_app/view/Login_Register/auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


   @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  
  void _navigateToNextScreen() async {
    // Simulate a delay before navigating to the next screen
    await Future.delayed(Duration(seconds: 6));
    // Navigate to the next screen
   Get.off(AuthPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Lottie.asset('assets/animation_lo7pmc9e.json'
      ,fit: BoxFit.fill,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      repeat: false
      ) ,
    );
  }
}