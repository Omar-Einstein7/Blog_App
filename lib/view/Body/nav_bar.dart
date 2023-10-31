import 'package:blog_viewer_app/view/Login_Register/LoginScreen.dart';
import 'package:blog_viewer_app/view/Profile/Profile.dart';
import 'package:blog_viewer_app/view/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';

import '../../controller/theme.dart';

class Nav_Bar extends StatefulWidget {
  const Nav_Bar({super.key});

  @override
  State<Nav_Bar> createState() => _Nav_BarState();
}

class _Nav_BarState extends State<Nav_Bar> {
  late PageController _pageController;
  int selectedIndex = 0;
  bool colorful = false;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: selectedIndex);
  }

  void onButtonPressed(int index) {
    setState(() {
      selectedIndex = index;
    });
    _pageController.animateToPage(selectedIndex,
        duration: const Duration(milliseconds: 400), curve: Curves.easeOutQuad);
  }

  final ThemeProvider themeProvider = Get.put(ThemeProvider());
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _pageController,
                children: _listOfWidget,
              ),
            ),
          ],
        ),
        bottomNavigationBar: SlidingClippedNavBar(
          backgroundColor: themeProvider.themeMode().nav!,
          onButtonPressed: onButtonPressed,
          iconSize: 30,
          inactiveColor: Color.fromARGB(255, 23, 76, 149),
          activeColor: Color.fromARGB(255, 20, 63, 124),
          selectedIndex: selectedIndex,
          barItems: <BarItem>[
            BarItem(
              icon: Iconsax.home,
              title: 'Home',
            ),
            BarItem(
              icon: Iconsax.profile_2user,
              title: 'Profile',
            ),
          ],
        ),
      );
    });
  }
}

List<Widget> _listOfWidget = <Widget>[
  Center(child: home()),
  Center(child: Profile())
];
