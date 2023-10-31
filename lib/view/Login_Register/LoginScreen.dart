import 'package:blog_viewer_app/controller/validation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

import '../../components/My_TextField.dart';
import '../../components/Squiretile.dart';
import '../../components/my_button.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text editing controllers
  final emailController = TextEditingController();

  final passwordController = TextEditingController();
  String errorMessage = '';

  // sign user in method
  void signUserIn() async{


    
     
    try{
     if(key.currentState!.validate()){
       await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text
      );
       Get.back(result: context);
     }
     
    
     
    } on FirebaseAuthException catch(e){
       if(e.code == 'network-request-failed'){
        Get.snackbar("Connection", "NO NETWORK" , duration: Duration(seconds: 4));
       }else{
        Get.back(result: context);
        Get.snackbar("User Not Found", "Invalid Email or Password" , duration: Duration(seconds: 4));
       }

       
    }

    
  }



    void wrongmessage(String message){
    showDialog(context: context,
    builder: (context){
      return AlertDialog(
        title: Center(child: Text(message)),
      );
    });
  }
  User? user = FirebaseAuth.instance.currentUser;
    final GlobalKey<FormState> key = GlobalKey<FormState>();
    validatecont validate = Get.put(validatecont());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBody: true,
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Form(
          key: key,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
            
                  // logo
                  const Icon(
                    Icons.lock,
                    size: 100,
                  ),
            
                  const SizedBox(height: 50),
            
                  // welcome back, you've been missed!
                  Text(
                    'Welcome back you\'ve been missed!',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 16,
                    ),
                  ),
            
                  const SizedBox(height: 25),
            
                  // Email textfield
                  MyTextField(
                    controller: emailController,
                    hintText: 'Email',
                    obscureText: false,
                    validate: validate.validateEmail,
                    
                  ),
            
                  const SizedBox(height: 10),
            
                  // password textfield
                  MyTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: true,
                    validate: validate.validatePassword,
                  ),
            
                  const SizedBox(height: 10),
            
                  // forgot password?
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Forgot Password?',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ),
            
                  const SizedBox(height: 25),
            
                  // sign in button
                  MyButton(
                    onTap: signUserIn,
                    text: "Login",
                  ),
            
                  const SizedBox(height: 50),
            
                  // or continue with
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            'Or continue with',
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          ),
                        ),
                      ],
                    ),
                  ),
            
                  const SizedBox(height: 50),
            
                  // google + apple sign in buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      // google button
                      SquareTile(imagePath: 'lib/images/google.png'),
            
                      SizedBox(width: 25),
            
                      // apple button
                      SquareTile(imagePath: 'lib/images/apple.png')
                    ],
                  ),
            
                  const SizedBox(height: 30),
            
                  // not a member? register now
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Not a member?',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: const Text(
                          'Register now',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
