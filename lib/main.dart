
import 'package:blog_viewer_app/controller/theme.dart';
import 'package:blog_viewer_app/firebase_options.dart';

import 'package:blog_viewer_app/view/SplashScreen/SplashScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
    final ThemeProvider themeProvider = Get.put(ThemeProvider());
  runApp(
     GetMaterialApp(
      // theme: themeProvider.themeData(),
        debugShowCheckedModeBanner: false,
    home: SplashScreen()));
    //AuthPage
}


