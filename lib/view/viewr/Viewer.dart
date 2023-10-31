import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/theme.dart';
import '../../utils/widtchheight.dart';

class ViewerScreen extends StatelessWidget {
  final String title;
  final String path;
  final String body;
  final String original;
  ViewerScreen(
      {super.key, required this.title, required this.body, required this.path, required this.original});
  final ThemeProvider themeProvider = Get.put(ThemeProvider());

  double width = MediaQueryHelper.screenWidth;

  double height = MediaQueryHelper.screenHeight;
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: themeProvider.themeMode().AppBar,
        ),
        backgroundColor: themeProvider.themeMode().swithbgcolor,
        body: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                margin: EdgeInsets.all(10),
                width: width,
                height: height / 2,
                decoration: BoxDecoration(
                    color: themeProvider.themeMode().switchcolor,
                    borderRadius: BorderRadius.circular(30)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        margin: EdgeInsets.all(20),
                        child: CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage(path),
                        )),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: themeProvider.themeMode().arrow,
                                fontSize: 20),
                          ),
                          Divider(
                            color: Colors.white,
                          ),
                          Text(
                           original ,
                            style: TextStyle(
                                color: themeProvider.themeMode().arrow,
                                fontSize: 19),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: SizedBox(),
            )
          ],
        ),
      );
    });
  }
}
