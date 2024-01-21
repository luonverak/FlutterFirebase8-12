import 'package:firebase8_12/auth/controller/user_controller.dart';
import 'package:firebase8_12/auth/model/user_model.dart';
import 'package:firebase8_12/auth/widget/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/text_field.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final email = TextEditingController();
  final password = TextEditingController();
  final cfPassword = TextEditingController();
  final userController = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(Icons.arrow_back),
                  ),
                  const Spacer(flex: 2),
                  const Text(
                    'Register Account',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  const Spacer(flex: 3),
                ],
              ),
              const SizedBox(height: 100),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextFieldWidget(
                      controller: email,
                      hintText: 'Email',
                      prefixIcon: const Icon(Icons.email),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFieldWidget(
                      controller: password,
                      hintText: 'Password',
                      prefixIcon: const Icon(Icons.email),
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.visibility_off),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFieldWidget(
                      controller: cfPassword,
                      hintText: 'Confirm password',
                      prefixIcon: const Icon(Icons.email),
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.visibility_off),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    GestureDetector(
                      onTap: () async {
                        if (password.text.trim() == cfPassword.text.trim()) {
                          await userController.createUser(UserModel(
                              email: email.text,
                              password: password.text.trim()));
                        } else {
                          print('error');
                        }
                      },
                      child: buttonWidget('Create Account'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
