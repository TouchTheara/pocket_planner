import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:injectable/injectable.dart';
import 'package:pocket_planner/module/profile/data/repository/profile_repository.dart';

import '../../../../core/service_locator/service_locator.dart';
import '../../data/model/profile_model.dart';

class ProfileController extends GetxController {
  @factoryMethod
  static init() => Get.put(ProfileController());

  /// Fetch profile API:
  var profileData = ProfileModel().obs;

  final isLoading = false.obs;
  Future<ProfileModel> functionGetProfileData(BuildContext context,
      {bool isGoogle = false}) async {
    isLoading(true);
    await getIt<ProfileRepository>()
        .getProfileData(context, isGoogle: isGoogle)
        .then((value) async {
      profileData.value = value;
      await FirebaseMessaging.instance.subscribeToTopic("${value.userName}");
      debugPrint("-----success get controller Profile  ==${value.imageUrl}");
      isLoading(false);
    });
    return profileData.value;
  }

  File? profileImage;

  Future uploadProfileImage(BuildContext context, {required File file}) async {
    isLoading(true);
    try {
      await getIt<ProfileRepository>().uploadProfile(image: file.path);
    } catch (e) {
      isLoading(false);
      debugPrint("----Error Catch Block$e");
    } finally {
      isLoading(false);
      functionGetProfileData(context, isGoogle: false);
    }
  }
}
