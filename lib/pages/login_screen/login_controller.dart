import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whiteboard/whiteboard.dart';

class LoginController extends GetxController{

  final formKey = GlobalKey<FormState>();
  final TextEditingController idController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  RxBool obscureText = true.obs;
  RxString selectedRole = RxString('Teacher');

  void togglePasswordVisibility() {
      obscureText.toggle();
  }

  void checkLoginCredentials(){
    if (idController.text == 'akhileshredomud@gmail.com' &&
        passwordController.text == '1234') {
      // Successful login logic here
      print('Login successful');
    } else {
      // Error handling here
      print('Invalid credentials or captcha');
    }
  }


}