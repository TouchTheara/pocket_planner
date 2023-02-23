import 'package:flutter/material.dart';

abstract class AuthRepositoryBase {
  Future<void> getAuthOTP(
    BuildContext context, {
    String phone,
    Function? funcWhenSuccess,
  });
  Future<void> signUpAuth(
    BuildContext context, {
    String phone,
    String password,
    Function? funcWhenSuccess,
  });
  Future<void> logInAuth(
    BuildContext context, {
    String phone,
    String password,
    Function? funcWhenSuccess,
  });
  Future<void> verifyAuthOTP(BuildContext context,
      {String phone, Function? funcWhenSuccess, String otp, String hash});
}
