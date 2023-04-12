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
      debugPrint(
          "-----success get controller Planner ==${profileData.value.imageUrl}}");
      isLoading(false);
    });
    return profileData.value;
  }

  File? profileImage;
  Future uploadProfileImage() async {
    await getIt<ProfileRepository>()
        .uploadProfileImage(image: profileImage?.path);
  }
}
