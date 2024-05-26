import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: LoginController(),
        builder: (_) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Login'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Select Date Of Birth";
                        }
                        else if (value != "akhileshredomud@gmail.com"){
                          return "Wrong Id";
                        }
                        return null;
                      },
                      controller: _.idController,
                      decoration: const InputDecoration(
                        labelText: 'ID',
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      controller: _.passwordController,
                      obscureText: _.obscureText.value,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Select Date Of Birth";
                        }
                        else if (value != "Akki@123"){
                          return "Wrong Password";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Password',
                        suffixIcon: IconButton(
                          icon: Icon(
                            _.obscureText.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: _.togglePasswordVisibility,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    const Text(
                      'Select Role:',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    ListTile(
                      title: const Text('Principal'),
                      leading: Radio<String>(
                        value: 'Principal',
                        groupValue: _.selectedRole.value,
                        onChanged: (String? value) {
                          _.selectedRole.value = value!;
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text('Teacher'),
                      leading: Radio<String>(
                        value: 'Teacher',
                        groupValue: _.selectedRole.value,
                        onChanged: (String? value) {
                          _.selectedRole.value = value!;
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text('Department'),
                      leading: Radio<String>(
                        value: 'Department',
                        groupValue: _.selectedRole.value,
                        onChanged: (String? value) {
                          _.selectedRole.value = value!;
                        },
                      ),
                    ),
                    const SizedBox(height: 24.0),
                    const Text(
                      'Caption: Please select your role and enter your credentials',
                      style: TextStyle(fontSize: 14.0, color: Colors.grey),
                    ),
                    const SizedBox(height: 24.0),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          if (_.formKey.currentState!.validate()) {
                            Get.offNamed('/');
                          }
                        },
                        child: const Text('Sign In'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
