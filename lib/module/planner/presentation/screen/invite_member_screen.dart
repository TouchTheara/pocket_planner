import 'package:flutter/material.dart';
import 'package:pocket_planner/config/app_colors.dart';
import 'package:pocket_planner/widget/cuctom_textfield.dart';

class InviteMemberScreen extends StatelessWidget {
  const InviteMemberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const CustomTextField(
            hintText: "Search By Username",
          ),
          centerTitle: false,
          elevation: 0,
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Column(
          children: [
            InkWell(
              onTap: () {
                debugPrint("statement");
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                color: Colors.transparent,
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: AppColors.primaryColor,
                      child: Text(
                        "AP",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Tota Abela",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(height: 7),
                        Text(
                          "+85593461502",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
