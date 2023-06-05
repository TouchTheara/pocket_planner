import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

class FileController extends GetxController {
  @factoryMethod
  static init() => Get.put(FileController());

  // final fileImage = XFile('').obs;

  Future<XFile> funcAssignTakePhotoFile(BuildContext? context) async {
    XFile? fileImage;
    fileImage = await ImagePicker().pickImage(source: ImageSource.camera);
    debugPrint("========TESTING File: ${fileImage!.path}");

    return fileImage;
  }

  Future<XFile> funcAssignChoosePhotoFile(BuildContext? context) async {
    XFile? fileImage;
    fileImage = XFile('');
    fileImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    debugPrint("========TESTING File: ${fileImage!.path}");

    return fileImage;
  }
}
