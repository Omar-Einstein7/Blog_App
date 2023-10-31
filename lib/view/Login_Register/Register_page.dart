import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../components/My_TextField.dart';
import '../../components/Squiretile.dart';
import '../../components/my_button.dart';
import '../../controller/validation.dart';



class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // text editing controllers
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

    final confirmpasswordController = TextEditingController();
   
    final GlobalKey<FormState> key = GlobalKey<FormState>();
    String errorMessage = '';

  // sign user in method
  Future signUserUp() async{
     
  
     
    try{
      

      if(key.currentState!.validate()){

      if(passwordController.text == confirmpasswordController.text ){
      
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text
      );
   
    }else{
     Get.snackbar("Error", "passwords not match");
    }
    }     
    } on FirebaseAuthException catch(e){


      if (e.code == 'network-request-failed'){
        Get.snackbar("Connection", "NO NETWORK" , duration: Duration(seconds: 4));

      }else if(e.code == 'email-already-in-use'){
        Get.snackbar("", "Email Already in Use" , duration: Duration(seconds: 4));
      }else{
        Get.back(result: context);
      
        errorMessage = e.message!;
        Get.snackbar("Error", errorMessage);
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
                  const SizedBox(height: 20),
            
                  // logo
                  const Icon(
                    Icons.lock,
                    size: 50,
                  ),
            
                  const SizedBox(height: 40),
            
                  // welcome back, you've been missed!
                  Text(
                    'Let\'s Create Account',
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
                  MyTextField(
                    controller: confirmpasswordController,
                    hintText: 'Confirm Password',
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
                    onTap: signUserUp,
                    text: "SignUp",
                  ),
            
                  const SizedBox(height: 30),
            
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
            
                  const SizedBox(height: 30),
            
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
            
                  const SizedBox(height: 20),
            
                  // not a member? register now
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already Have an Account?',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: const Text(
                          'login now',
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
