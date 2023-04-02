import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:pocket_planner/config/app_colors.dart';
import 'package:pocket_planner/core/service_locator/service_locator.dart';
import 'package:pocket_planner/module/profile/presentation/logic/profile_controller.dart';
import 'package:pocket_planner/widget/custom_button.dart';
import 'package:pocket_planner/widget/custom_loading.dart';

import '../widget/info_profile_custom.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    getdata();
    super.initState();
  }

  getdata() async {
    await getIt<ProfileController>()
        .functionGetProfileData(context)
        .then((value) {
      debugPrint(value.imageUrl);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => getIt<ProfileController>().isLoading.value
          ? const CustomLoading()
          : Scaffold(
              appBar: AppBar(
                title: const Text("My Profile"),
                elevation: 0,
              ),
              backgroundColor: Theme.of(context).colorScheme.background,
              body: Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: CachedNetworkImage(
                            imageUrl: getIt<ProfileController>()
                                    .profileData
                                    .value
                                    .imageUrl ??
                                "data:image/jpeg;base64,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",
                            placeholder: (context, url) =>
                                const CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                            fit: BoxFit.fill),
                      ),
                      GestureDetector(
                        onTap: () async {
                          showDialog(
                            context: context,
                            builder: (_) => SimpleDialog(
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 10),
                              children: [
                                InkWell(
                                  onTap: () async {
                                    Navigator.pop(context);
                                    XFile? file = await ImagePicker()
                                        .pickImage(source: ImageSource.camera);

                                    if (file != null) {
                                      getIt<ProfileController>().profileImage =
                                          File(file.path);
                                      await getIt<ProfileController>()
                                          .uploadProfileImage();
                                    }
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(16),
                                    child: Text(
                                      "Take Photo",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () async {
                                    Navigator.pop(context);
                                    XFile? file = await ImagePicker()
                                        .pickImage(source: ImageSource.gallery);

                                    if (file != null) {
                                      getIt<ProfileController>().profileImage =
                                          File(file.path);
                                      await getIt<ProfileController>()
                                          .uploadProfileImage();
                                    }
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(16),
                                    child: Text(
                                      "Choose Photo",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.primaryColor,
                              border:
                                  Border.all(color: Colors.white, width: 2)),
                          child: const Icon(
                            Icons.add,
                            size: 20,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12, bottom: 12),
                    child: Text(
                      "${getIt<ProfileController>().profileData.value.lastName?.toUpperCase()} ${getIt<ProfileController>().profileData.value.firstName?.toLowerCase()}",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(fontWeight: FontWeight.w700),
                    ),
                  ),
                  infoProfileCustom(
                    context,
                    title: "Phone",
                    data: getIt<ProfileController>()
                        .profileData
                        .value
                        .phoneNumber,
                  ),
                  infoProfileCustom(
                    context,
                    title: "Email",
                    data: "sruntola@gmail.com",
                  ),
                  infoProfileCustom(
                    context,
                    title: "Date of Birth",
                    data: DateFormat('dd MMM yyyy').format(DateTime.parse(
                        getIt<ProfileController>()
                            .profileData
                            .value
                            .birthday!)),
                  ),
                  infoProfileCustom(
                    context,
                    title: "Sex",
                    data: getIt<ProfileController>().profileData.value.sex,
                  ),
                  infoProfileCustom(
                    context,
                    title: "Change Password",
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    child: SafeArea(
                      child: CustomButton(
                        titleBTN: "Delete Account",
                        color: Theme.of(context).colorScheme.background,
                        borderColor: AppColors.errorColor,
                        styleBTN:
                            Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.errorColor,
                                ),
                        ontap: () {},
                      ),
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
