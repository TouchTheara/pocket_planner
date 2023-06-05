import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pocket_planner/config/app_colors.dart';
import 'package:pocket_planner/core/service_locator/service_locator.dart';
import 'package:pocket_planner/module/profile/presentation/logic/profile_controller.dart';
import 'package:pocket_planner/widget/custom_button.dart';

import '../../../../util/file_handler/file_controller.dart';
import '../../../../widget/custom_loading.dart';
import '../../../../widget/change_profile_photo.dart';
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
      // debugPrint(value.imageUrl);
    });
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
    return Obx(
      () => getIt<ProfileController>().isLoading.value
          ? const CustomLoading()
          : Scaffold(
              key: key,
              appBar: AppBar(
                title: const Text("My Profile"),
                elevation: 0,
              ),
              backgroundColor: Theme.of(context).colorScheme.background,
              body: Column(
                children: [
                  InkWell(
                    onTap: () {
                      funcChangeProfilePhoto(context, ontapTakePhoto: () async {
                        await getIt<FileController>()
                            .funcAssignTakePhotoFile(
                          context,
                        )
                            .then((value) async {
                          getIt<ProfileController>().profileImage =
                              File(value.path);
                          await getIt<ProfileController>().uploadProfileImage(
                              context,
                              file: File(value.path));
                        });
                      }, ontapChoosePhoto: () async {
                        await getIt<FileController>()
                            .funcAssignChoosePhotoFile(
                          context,
                        )
                            .then((value) async {
                          getIt<ProfileController>().profileImage =
                              File(value.path);
                          await getIt<ProfileController>().uploadProfileImage(
                              context,
                              file: File(value.path));
                        });
                      });
                    },
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          decoration:
                              const BoxDecoration(shape: BoxShape.circle),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Image.network(
                              '${getIt<ProfileController>().profileData.value.imageUrl}',
                              // placeholder: (context, url) =>
                              //     const CircularProgressIndicator(),
                              // errorWidget: (context, url, error) =>
                              //     const Icon(Icons.error),
                              fit: BoxFit.fill),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.primaryColor,
                              border: Border.all(
                                  color:
                                      Theme.of(context).colorScheme.background,
                                  width: 2)),
                          padding: const EdgeInsets.all(5),
                          child: const Icon(
                            Icons.camera_alt_outlined,
                            size: 12,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12, bottom: 12),
                    child: Text(
                      "${getIt<ProfileController>().profileData.value.firstName?.toUpperCase()} ${getIt<ProfileController>().profileData.value.lastName?.toUpperCase()}",
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
                        getIt<ProfileController>().profileData.value.birthday ??
                            '')),
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
