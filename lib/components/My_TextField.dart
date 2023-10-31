import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/theme.dart';
import '../controller/validation.dart';

class MyTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  var validate;

    MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.validate
  });


  @override
  Widget build(BuildContext context) {

      final ThemeProvider themeProvider = Get.put(ThemeProvider());
      
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextFormField(
        style: TextStyle( color: Colors.black),
        controller: controller,
        obscureText: obscureText,
        validator:  validate,
        decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
            fillColor: themeProvider.themeMode().arrow,
            filled: true,
            hintText: hintText,
),
      ),
    );
  }
}
