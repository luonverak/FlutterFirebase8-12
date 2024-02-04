import 'package:firebase8_12/auth/controller/user_controller.dart';
import 'package:firebase8_12/home/view/add_edit_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final userController = Get.put(UserController());
  final textStyle = const TextStyle(fontSize: 18, color: Colors.white);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[100],
        title: const Text(
          'HomeScreen',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
            onPressed: () => userController.logoutAccount(),
            icon: const Icon(
              Icons.logout,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Slidable(
            endActionPane: ActionPane(
              motion: const ScrollMotion(),
              children: [
                SlidableAction(
                  onPressed: (context) => Get.to(AddEditScreen()),
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  icon: Icons.edit,
                  label: 'Edit',
                ),
                SlidableAction(
                  onPressed: (context) {},
                  borderRadius: BorderRadius.circular(10),
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  label: 'Delete',
                ),
              ],
            ),
            child: Card(
              color: Colors.grey,
              child: ListTile(
                leading: const CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.amber,
                ),
                title: Text(
                  'Tittle',
                  style: textStyle,
                ),
                subtitle: Text(
                  "Subtitle",
                  style: textStyle,
                ),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(AddEditScreen()),
        backgroundColor: Colors.blue,
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }
}
