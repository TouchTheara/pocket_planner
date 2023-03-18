import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pocket_planner/core/auth/presentation/logic/auth_controller.dart';

import '../../../../module/planner/presentation/logic/planner_controller.dart';
import '../../../../util/helper/dio_bese_helper.dart';
import '../../../../util/helper/local_data/get_local_data.dart';
import '../../../service_locator/service_locator.dart';
import '../../domain/auth_base_repository.dart';

class AuthReposity implements AuthRepositoryBase {
  @override
  Future<void> getAuthOTP(
    BuildContext context, {
    String? phone,
    Function? funcWhenSuccess,
  }) async {
    try {
      await getIt<DioBaseHelper>().onRequest(
          methode: METHODE.post,
          isAuthorize: false,
          url: 'get-otp',
          body: {"user_name": phone}).then((value) {
        funcWhenSuccess?.call();
        getIt<AuthController>().hashValue.value = value['hash'];

        debugPrint("--------------$value----------");
      });
    } catch (e) {
      debugPrint("============Error $e --=============");
    }
  }

  @override
  Future<void> verifyAuthOTP(BuildContext context,
      {String? phone,
      Function? funcWhenSuccess,
      String? otp,
      String? hash}) async {
    try {
      await getIt<DioBaseHelper>().onRequest(
          methode: METHODE.post,
          isAuthorize: false,
          url: 'verify-otp',
          body: {"user_name": phone, "otp": otp, "hash": hash}).then((value) {
        funcWhenSuccess?.call();

        debugPrint("--------------$value----------");
      }).onError((ErrorModel error, stackTrace) {
        debugPrint(error.bodyString.toString());
      });
    } catch (e) {
      debugPrint("============Error $e --=============");
    }
  }

  @override
  Future<void> signUpAuth(
    BuildContext context, {
    String? phone,
    String? password,
    Function? funcWhenSuccess,
  }) async {
    try {
      await getIt<DioBaseHelper>().onRequest(
          methode: METHODE.post,
          isAuthorize: false,
          url: 'sign-up',
          body: {"user_name": phone, "password": password}).then((value) async {
        funcWhenSuccess?.call();
        await LocalDataStorage.storeCurrentUser(value['token']);
        await LocalDataStorage.storeString(
            'refreshToken', value['refreshToken']);
        debugPrint("--------------$value----------");
      }).onError((ErrorModel error, stackTrace) {
        if (error.statusCode == 401 || error.statusCode == 403) {
          getIt<AuthController>().getRefreshToken();
        }
        debugPrint(error.bodyString.toString());
      });
    } catch (e) {
      debugPrint("============Error $e --=============");
    }
  }

  @override
  Future<void> logInAuth(
    BuildContext context, {
    String? phone,
    String? password,
    Function? funcWhenSuccess,
  }) async {
    try {
      await getIt<DioBaseHelper>().onRequest(
          methode: METHODE.post,
          isAuthorize: false,
          url: 'login',
          body: {"user_name": phone, "password": password}).then((value) async {
        await LocalDataStorage.storeString(
            'refreshToken', value['refreshToken']);

        await LocalDataStorage.storeCurrentUser(value['token']).then((value) {
          getIt<AuthController>().funtionFetchFirst();

          context.go('/');
        });

        debugPrint("--------------$value----------");
      }).onError((ErrorModel error, stackTrace) {
        if (error.statusCode == 401) {
          getIt<AuthController>().getRefreshToken();
        }
        debugPrint(error.bodyString.toString());
      });
    } catch (e) {
      debugPrint("============Error $e --=============");
    }
  }

  @override
  Future<void> getRefreshToken({String? phone}) async {
    try {
      var refreshToken = await LocalDataStorage.getString('refreshToken');

      await getIt<DioBaseHelper>().onRequest(
          methode: METHODE.post,
          isAuthorize: false,
          url: 'token',
          body: {
            "user_name": phone,
            "refreshToken": refreshToken
          }).then((value) async {
        // await LocalDataStorage.removeCurrentUser();
        debugPrint("=========>>>Testing refresh token: $value");

        await LocalDataStorage.storeCurrentUser(value['token'])
            .then((value) async {
          await getIt<AuthController>().funtionFetchFirst();
          await getIt<PlannerController>().functionFetchDataPlanner();
        });

        // debugPrint("----ddd----------$value----------");
      }).onError((ErrorModel error, stackTrace) {
        debugPrint(error.bodyString.toString());
      });
    } catch (e) {
      debugPrint("============Error $e --=============");
    }
  }
}
