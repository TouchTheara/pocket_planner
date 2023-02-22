import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
    await getIt<DioBaseHelper>().onRequest(
        methode: METHODE.post,
        isAuthorize: false,
        url: 'get-otp',
        body: {"user_name": phone}).then((value) {
      context.go('/otp');
      debugPrint("--------------$value----------");
    });
  }

  @override
  Future<void> verifyAuthOTP() async {}
}
