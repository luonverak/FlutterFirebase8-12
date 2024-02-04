import 'dart:io';

import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:firebase8_12/home/controller/storage_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../widget/input_field.dart';

class AddEditScreen extends StatelessWidget {
  AddEditScreen({super.key});
  final title = TextEditingController();
  final description = TextEditingController();
  final storageController = Get.put(StorageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[100],
        title: const Text(
          'Add ',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              await storageController
                  .uploadFile(XFile(storageController.file!.path));
            },
            icon: const Icon(
              Icons.save,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Stack(
                children: [
                  GetBuilder<StorageController>(
                    builder: (controller) => Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.blue,
                        image: storageController.file != null
                            ? DecorationImage(
                                fit: BoxFit.cover,
                                image: FileImage(
                                  File(storageController.file!.path),
                                ),
                              )
                            : const DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  'asset/image/note.png',
                                ),
                              ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    right: 10,
                    child: GestureDetector(
                      onTap: () {
                        showAdaptiveActionSheet(
                          context: context,
                          androidBorderRadius: 30,
                          actions: [
                            BottomSheetAction(
                                title: const Text('Open Camera'),
                                onPressed: (context) {}),
                            BottomSheetAction(
                              title: const Text('Choose Gallery'),
                              onPressed: (context) async {
                                await storageController
                                    .openGallery()
                                    .whenComplete(() => Get.back());
                              },
                            ),
                          ],
                          cancelAction: CancelAction(
                            title: const Text('Cancel'),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: const Color.fromARGB(255, 142, 142, 142),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(6.0),
                          child: Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              TextFieldWidget(
                controller: title,
                hintText: 'Enter Title',
                obscureText: false,
              ),
              const SizedBox(height: 10),
              TextFieldWidget(
                controller: description,
                hintText: 'Enter Description',
                maxLines: 10,
                obscureText: false,
              )
            ],
          ),
        ),
      ),
    );
  }
}
