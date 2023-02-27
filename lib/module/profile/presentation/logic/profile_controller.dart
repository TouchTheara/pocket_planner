import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocket_planner/module/profile/data/repository/profile_repository.dart';

import '../../../../core/service_locator/service_locator.dart';
import '../../data/model/profile_model.dart';

class ProfileController extends GetxController {
  /// Fetch profile API:
  var profileData = ProfileModel().obs;
  final isLoading = false.obs;
  Future<ProfileModel> functionGetProfileData(BuildContext context,
      {bool isGoogle = false}) async {
    isLoading(true);
    getIt<ProfileRepository>()
        .getProfileData(context, isGoogle: isGoogle)
        .then((value) {
      profileData.value = value;
      debugPrint("-----success get controller Planner ==$profileData}");
      isLoading(false);
    });
    return profileData.value;
  }
}
