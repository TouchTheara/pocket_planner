import 'package:flutter/material.dart';
import 'package:pocket_planner/module/profile/data/model/profile_model.dart';

import '../../../../core/service_locator/service_locator.dart';
import '../../../../util/helper/dio_bese_helper.dart';
import '../../domain/profile_base_repository.dart';

class ProfileRepository implements ProfileRepositoryBase {
  @override
  Future<ProfileModel> getProfileData(BuildContext context,
      {bool isGoogle = false}) async {
    var profileData = ProfileModel();

    await getIt<DioBaseHelper>()
        .onRequest(
            url: isGoogle ? "get-profile?login_from=google" : "get-profile",
            methode: METHODE.get,
            isAuthorize: true)
        .then((response) {
      profileData = ProfileModel.fromJson(response['result']);

      debugPrint(
          "------- get profile success from repo : ${response['result']}");
    }).onError((ErrorModel error, stackTrace) {
      debugPrint("on status error data : ${error.statusCode}");
      debugPrint("on status error data Body: ${error.bodyString}");
    });
    return profileData;
  }
}
