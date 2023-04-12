// ignore_for_file: await_only_futures

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pocket_planner/config/app_colors.dart';
import 'package:pocket_planner/module/planner/presentation/logic/planner_controller.dart';

import '../core/service_locator/service_locator.dart';
import '../util/form_builder/create_project_form.dart';
import 'custom_modal_sheet.dart';

openAlertBox(BuildContext context) {
  return showDialog(
      context: context,
      builder: (BuildContext contextAlert) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              InkWell(
                onTap: () {
                  contextAlert.pop();
                },
                child: Row(
                  children: [
                    const Icon(Icons.person_add, color: AppColors.primaryColor),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: const Text('Invited Member'),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Divider(
                color: Colors.grey,
                height: 4.0,
              ),
              InkWell(
                onTap: () {
                  contextAlert.pop();
                  getIt<PlannerController>().functionDeleteDataPlanner(context,
                      id: getIt<PlannerController>().projectId.value,
                      functionSuccess: () async {
                    context.pop();
                    await getIt<PlannerController>().functionFetchDataPlanner;
                  });
                },
                child: Row(
                  children: [
                    const Icon(Icons.bookmark, color: AppColors.primaryColor),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: const Text('Mark as finished'),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Divider(
                color: Colors.grey,
                height: 4.0,
              ),
              const SizedBox(
                height: 5,
              ),
              InkWell(
                onTap: () {
                  contextAlert.pop();
                },
                child: Row(
                  children: [
                    const Icon(
                      Icons.push_pin,
                      color: AppColors.primaryColor,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        // borderRadius: BorderRadius.circular(60),
                      ),
                      child: const Text('Pin to dashboard'),
                    ),
                  ],
                ),
              ),
              const Divider(
                color: Colors.grey,
                height: 4.0,
              ),
              const SizedBox(
                height: 5,
              ),
              InkWell(
                onTap: () {
                  context.pop();
                  customModelSheet(context,
                      child: const CreateProjectFrom(
                        isCreate: false,
                      ));
                },
                child: Row(
                  children: [
                    const Icon(
                      Icons.system_security_update,
                      color: AppColors.primaryColor,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        // borderRadius: BorderRadius.circular(60),
                      ),
                      child: const Text('Update Project'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      });
}
