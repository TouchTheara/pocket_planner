import 'package:flutter/material.dart';

abstract class AuthRepositoryBase {
  Future<void> getAuthOTP(
    String phone,
    BuildContext context,
    Function? funcWhenSuccess,
  );
  Future<void> verifyAuthOTP(String phone, BuildContext context,
      Function? funcWhenSuccess, String otp, String hash);
}
