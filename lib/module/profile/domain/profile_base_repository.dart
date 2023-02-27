import 'package:flutter/material.dart';

abstract class ProfileRepositoryBase {
  Future<void> getProfileData(BuildContext context, {bool isGoogle = false});
}
