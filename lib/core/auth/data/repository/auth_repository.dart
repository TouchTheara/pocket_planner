import 'package:flutter/material.dart';
import 'package:pocket_planner/core/auth/presentation/logic/auth_controller.dart';

import '../../../../util/helper/dio_bese_helper.dart';
import '../../../service_locator/service_locator.dart';
import '../../domain/auth_base_repository.dart';

class AuthReposity implements AuthRepositoryBase {
  @override
  Future<void> getAuthOTP(
    String phone,
    BuildContext context,
    Function? funcWhenSuccess,
  ) async {
    try {
      await getIt<DioBaseHelper>().onRequest(
          methode: METHODE.post,
          isAuthorize: false,
          url: 'get-otp',
          body: {"user_name": phone}).then((value) {
        funcWhenSuccess;
        getIt<AuthController>().hashValue.value = value['hash'];

        debugPrint("--------------$value----------");
      });
    } catch (e) {
      debugPrint("============Error $e --=============");
    }
  }

  @override
  Future<void> verifyAuthOTP(String phone, BuildContext context,
      Function? funcWhenSuccess, String otp, String hash) async {
    try {
      await getIt<DioBaseHelper>().onRequest(
          methode: METHODE.post,
          isAuthorize: false,
          url: 'get-otp',
          body: {"user_name": phone, "otp": otp, "hash": hash}).then((value) {
        funcWhenSuccess;

        debugPrint("--------------$value----------");
      });
    } catch (e) {
      debugPrint("============Error $e --=============");
    }
  }
}
