import 'dart:io';
import 'dart:math';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class StorageController extends GetxController {
  XFile? file;
  RxString imageURL = ''.obs;
  Future<void> openGallery() async {
    try {
      final fileChoose =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      file = XFile(fileChoose!.path);
    } on Exception catch (e) {
      print(e);
    }
    update();
  }

  Future<void> uploadFile(XFile _file) async {
    final storageRef = FirebaseStorage.instance.ref();
    final imagesRef = storageRef.child("images/${_file.name}");
    try {
      await imagesRef.putFile(File(_file.path));
      imageURL.value = await imagesRef.getDownloadURL();
      print(imageURL.value);
    } catch (e) {
      print(e);
    }
    update();
  }
}
