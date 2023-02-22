import 'package:flutter/material.dart';

abstract class AuthRepositoryBase {
  Future<void> getAuthOTP(
    String phone,
    BuildContext context,
    //int resendOTP,
    Function? funcWhenSuccess,
  );
  Future<void> verifyAuthOTP();
}
