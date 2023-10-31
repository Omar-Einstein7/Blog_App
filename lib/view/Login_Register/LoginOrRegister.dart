import 'package:blog_viewer_app/view/Login_Register/LoginScreen.dart';
import 'package:flutter/material.dart';

import 'Register_page.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {


  bool showloginpage = true;


   void togglepage(){
   
      setState(() {
        showloginpage = !showloginpage;
      });
    
   }
  @override
  Widget build(BuildContext context) {
    if(showloginpage){
      return LoginPage(
        onTap: togglepage);

    }else{
      return RegisterPage(
        onTap: togglepage,);
    }
  }
}