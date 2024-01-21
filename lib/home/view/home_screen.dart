import 'package:firebase8_12/auth/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final userController = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeScreen'),
        actions: [
          IconButton(
            onPressed: () => userController.logoutAccount(),
            icon: Icon(Icons.logout),
          ),
        ],
      ),
    );
  }
}
