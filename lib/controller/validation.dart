import 'package:get/get.dart';

class validatecont extends GetxController{

  String? validateEmail(String? formEmail) {
  if (formEmail == null || formEmail.isEmpty)
    return 'E-mail address is required.';

      String pattern = r'\w+@\w+\.\w+';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(formEmail)) return 'Invalid E-mail Address format.';


  return null;
}

String? validatePassword(String? formPassword ) {
  if (formPassword == null || formPassword.isEmpty) return 'Password is required.';


   String pattern =
      r'^.{10,15}$';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(formPassword))
    return '''
      Password must be at least 8 characters,.
      ''';

  // if(pass != confirmpass)
  //   return "the Passwords doesn\'t";

  return null;
}





}