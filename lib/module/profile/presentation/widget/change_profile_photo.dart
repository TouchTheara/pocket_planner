import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/service_locator/service_locator.dart';
import '../logic/profile_controller.dart';

Future<dynamic> funcChangeProfilePhoto(BuildContext context) {
  if (Platform.isAndroid) {
    return showDialog(
      context: context,
      builder: (_) => SimpleDialog(
        contentPadding: const EdgeInsets.symmetric(vertical: 10),
        children: [
          InkWell(
            onTap: () async {
              Navigator.pop(context);
              XFile? file =
                  await ImagePicker().pickImage(source: ImageSource.camera);

              if (file != null) {
                getIt<ProfileController>().profileImage = File(file.path);
                await getIt<ProfileController>().uploadProfileImage();
              }
            },
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Text(
                "Take Photo",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
          InkWell(
            onTap: () async {
              Navigator.pop(context);
              XFile? file =
                  await ImagePicker().pickImage(source: ImageSource.gallery);

              if (file != null) {
                getIt<ProfileController>().profileImage = File(file.path);
                await getIt<ProfileController>().uploadProfileImage();
              }
            },
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Text(
                "Choose Photo",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
        ],
      ),
    );
  } else {
    return showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return CupertinoActionSheet(
          actions: [
            CupertinoActionSheetAction(
              onPressed: () async {
                Navigator.pop(context);
                XFile? file =
                    await ImagePicker().pickImage(source: ImageSource.camera);

                if (file != null) {
                  getIt<ProfileController>().profileImage = File(file.path);
                  await getIt<ProfileController>().uploadProfileImage();
                }
              },
              child: Text(
                "Take Photo",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.w600),
              ),
            ),
            CupertinoActionSheetAction(
              onPressed: () async {
                Navigator.pop(context);
                XFile? file =
                    await ImagePicker().pickImage(source: ImageSource.gallery);

                if (file != null) {
                  getIt<ProfileController>().profileImage = File(file.path);
                  await getIt<ProfileController>().uploadProfileImage();
                }
              },
              child: Text(
                "Choose Photo",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.w600),
              ),
            )
          ],
          cancelButton: CupertinoActionSheetAction(
            isDefaultAction: true,
            child: Text(
              "Cancel",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontWeight: FontWeight.w700),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        );
      },
    );
  }
}
