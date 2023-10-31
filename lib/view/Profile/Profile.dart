import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/theme.dart';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final user = FirebaseAuth.instance.currentUser;

  final ThemeProvider themeProvider = Get.put(ThemeProvider());

  String errorMessage = '';

  void logout() {
    try {
      FirebaseAuth.instance.signOut();
      errorMessage = '';
    } on FirebaseAuthException catch (error) {
      errorMessage = error.message!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: themeProvider.themeMode().swithbgcolor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  maxRadius: 65,
                  child: Text(
                    "${user?.email![0]}" ,
                    style: TextStyle(fontSize: 90 ,),
                  ),
                  // backgroundImage: AssetImage("assets/6195145.jpg"),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${user?.email}',
                  style: TextStyle(fontSize: 20, color: themeProvider.themeMode().arrow),
                )
              ],
            ),
            SizedBox(
              height: 45,
            ),
            Container(
              child: Expanded(
                  child: ListView(
                children: [
                  Card(
                    color: themeProvider.themeMode().switchcolor,
                    margin: EdgeInsets.only(left: 35, right: 35, bottom: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    child: ListTile(
                      leading: Icon(
                        Icons.change_circle,
                        color:  themeProvider.themeMode().arrow,
                      ),
                      title: Text(
                        'Change theme',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold,
                             color: themeProvider.themeMode().arrow),
                      ),
                      trailing: Obx(() {
                        return Switch(
                            value: themeProvider.isLightTheme.value,
                            onChanged: (value) =>
                                themeProvider.toggleThemeData());
                      }),
                    ),
                  ),
                  Card(
                     color: themeProvider.themeMode().switchcolor,
                    margin: EdgeInsets.only(left: 35, right: 35, bottom: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    child: ListTile(
                      
                      onTap: () {
                        logout();
                      },
                      leading: Icon(
                        Icons.logout,
                         color: themeProvider.themeMode().arrow,
                      ),
                      title: Text(
                        'Logout',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold,
                             color: themeProvider.themeMode().arrow),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios_outlined ,
                       color:  themeProvider.themeMode().arrow,),
                    ),
                  )
                ],
              )),
            )
          ],
        ),
      );
    });
  }
}
