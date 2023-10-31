
import 'package:blog_viewer_app/controller/theme.dart';
import 'package:blog_viewer_app/view/viewr/Viewer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Postwidget extends StatelessWidget {
  const Postwidget({super.key, required this.title, required this.body, required this.path, required this.original});
  final String title;
  final String body;
  final String path;
  final String original;

  @override
  Widget build(BuildContext context) {

    
    final ThemeProvider themeProvider = Get.put(ThemeProvider());
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          color: themeProvider.themeMode().switchcolor,
          borderRadius: BorderRadius.circular(20)
        ),
        child: ListTile(
          onTap: () {
            Get.to(ViewerScreen(title: title, body: body ,path: path , original: original,) 
            ,transition: Transition.fade );
          },
          leading: CircleAvatar(
            backgroundImage: AssetImage(path),
            // backgroundColor: themeProvider.themeMode().thumbcolor,
          ),
          trailing: Text(original,style: TextStyle(color: Colors.transparent, fontSize: 0),),
            title: Text(title, style: TextStyle(color: themeProvider.themeMode().arrow,),),
            subtitle: Text(body, style: TextStyle(color: themeProvider.themeMode().arrow,),),
            
            
        ),
      )
    );
  }
}