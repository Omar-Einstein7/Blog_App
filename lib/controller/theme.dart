import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/colors.dart';

class ThemeProvider extends GetxController {
    RxBool isLightTheme = true.obs;

  @override
  void onInit() {
    super.onInit();
    loadThemeFromPrefs();
  }

  void getCurrentStatusNavBarColor() {
    if (isLightTheme.value) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Colors.black,
        systemNavigationBarIconBrightness: Brightness.light,
        
      ),);
    } else {
         SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ));
     
    }
  }

  Future<void> toggleThemeData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    isLightTheme.value = !isLightTheme.value;
    sharedPreferences.setBool('isLight', isLightTheme.value);
    getCurrentStatusNavBarColor();
    themeData();
    update();
  }

  @override
  void onClose() {
    saveThemeToPrefs();
    super.onClose();
  }

  Future<void> saveThemeToPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLight', isLightTheme.value);
  }

  Future<void> loadThemeFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isLightTheme.value = prefs.getBool('isLight') ?? false;
    getCurrentStatusNavBarColor();
    themeData();
  }

  ThemeData themeData() {
    return ThemeData(
    hintColor: isLightTheme.value ?  AppColor.arrow:  AppColor.arrow2,
      appBarTheme:isLightTheme.value ?AppBarTheme( color: AppColor.appBar): AppBarTheme( color: AppColor.appBar2),
      brightness: isLightTheme.value ? Brightness.light : Brightness.dark,
      scaffoldBackgroundColor: isLightTheme.value ? AppColor.bgprimary3 : AppColor.bgsecond3,
      textTheme: TextTheme(
        titleMedium: TextStyle(
          color: isLightTheme.value ? Colors.white : Colors.black,
          fontSize: 20,
        ),
       
   bodySmall: TextStyle(
          color: isLightTheme.value ? Colors.white : Colors.black,
          fontSize: 24,
        ),
       
      ),
    );
  }

  ThemeMode themeMode() {
    return ThemeMode(
      switchcolor: isLightTheme.value ? AppColor.second : AppColor.primary,
      thumbcolor: isLightTheme.value ? AppColor.second2 : AppColor.primary2,
      swithbgcolor: isLightTheme.value ? AppColor.bgsecond3 : AppColor.bgprimary3,
      arrow: isLightTheme.value ? AppColor.arrow : AppColor.arrow2,
      AppBar: isLightTheme.value ? AppColor.appBar2 : AppColor.appBar,
      nav: isLightTheme.value ? AppColor.nav2 : AppColor.nav,
      
    );
  }
}

class ThemeMode {
  List<Color>? gradiantcolor;
  Color? switchcolor;
  Color? thumbcolor;
  Color? swithbgcolor;
  Color? arrow;
  Color? AppBar;
  Color? nav;

  ThemeMode({
    this.gradiantcolor,
    this.switchcolor,
    this.thumbcolor,
    this.swithbgcolor,
    this.arrow,
    this.AppBar,
    this.nav
  });
}