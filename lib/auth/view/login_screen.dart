import 'package:firebase8_12/auth/model/user_model.dart';
import 'package:firebase8_12/auth/view/register_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/user_controller.dart';
import '../widget/button.dart';
import '../widget/text_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final email = TextEditingController();
  final password = TextEditingController();
  final userController = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 120,
                  child: Image.asset('asset/image/logo-app.png'),
                ),
                const SizedBox(
                  width: double.infinity,
                  child: Text(
                    'Welcome to LAGO',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
                TextFieldWidget(
                  controller: email,
                  hintText: 'Enter your email',
                  prefixIcon: const Icon(Icons.email),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFieldWidget(
                  controller: password,
                  hintText: 'Enter your password',
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
                  onTap: () => userController.loginAccount(
                    UserModel(
                      email: email.text,
                      password: password.text.trim(),
                    ),
                  ),
                  child: buttonWidget('Login'),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Or',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 55,
                  child: Image.asset('asset/icon/search (1).png'),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CupertinoButton(
        child: const Text(
          'Register Account',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.blue,
          ),
        ),
        onPressed: () => Get.to(RegisterScreen()),
      ),
    );
  }
}
