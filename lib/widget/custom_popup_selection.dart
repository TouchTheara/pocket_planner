import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:pocket_planner/config/app_colors.dart';
import 'package:pocket_planner/module/planner/presentation/logic/planner_controller.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../core/service_locator/service_locator.dart';

import 'package:intl/intl.dart';

functionPopUpSelection(
  BuildContext context, {
  double percentHeight = 0.5,
  String? title,
  Function(dynamic, dynamic)? ontapDone,
  bool isCalender = false,
  bool isSeletionTime = false,
}) {
  List<String> listPriority = ["Low", 'Normal', "High", "Immediate"];
  // String selectedDate = '';
  // String dateCount = '';
  // String range = '';
  // String rangeCount = '';

  showCupertinoModalPopup(
    barrierDismissible: true,
    context: context,
    builder: (context) => Obx(() {
      debugPrint(getIt<PlannerController>().getValueDropDown1.value);
      return Material(
        child: ClipRRect(
          child: Container(
            height: MediaQuery.of(context).size.height * percentHeight,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              children: [
                Container(
                  height: 50,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                  ),
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "$title",
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(
                                fontSize: 18,
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.w600),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (isCalender) {
                            ontapDone!(
                                getIt<PlannerController>()
                                    .getValueDropDown1
                                    .value,
                                getIt<PlannerController>()
                                    .getValueDropDown2
                                    .value);
                          } else {
                            ontapDone!(
                                getIt<PlannerController>()
                                    .getValueDropDown1
                                    .value,
                                '');
                          }
                          context.pop();
                        },
                        child: Container(
                          color: Colors.transparent,
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            "Done",
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(
                                    fontSize: 18,
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.w600),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: !isCalender
                      ? Column(
                          children: [
                            ...listPriority
                                .map(
                                  (e) => Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, left: 10, right: 10),
                                    child: GestureDetector(
                                      onTap: () {
                                        getIt<PlannerController>()
                                            .getValueDropDown1
                                            .value = e;
                                      },
                                      child: Container(
                                          alignment: Alignment.center,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              color: getIt<PlannerController>()
                                                          .getValueDropDown1
                                                          .value ==
                                                      e
                                                  ? Colors.grey.shade400
                                                  : Colors.grey.shade100
                                                      .withOpacity(0.5),
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          padding: const EdgeInsets.all(10),
                                          child: Text(
                                            e,
                                            style: Theme.of(context)
                                                .textTheme
                                                .displayLarge!
                                                .copyWith(
                                                    fontSize: 14,
                                                    color: getIt<PlannerController>()
                                                                .getValueDropDown1
                                                                .value ==
                                                            e
                                                        ? Colors.white
                                                        : Colors.grey,
                                                    fontWeight:
                                                        FontWeight.w600),
                                          )),
                                    ),
                                  ),
                                )
                                .toList()
                          ],
                        )
                      : isSeletionTime
                          ? SfCalendar(
                              onSelectionChanged:
                                  (CalendarSelectionDetails value) {
                                debugPrint("---------${value.resource}");
                              },
                              view: CalendarView.day,
                              timeSlotViewSettings: const TimeSlotViewSettings(
                                  timeInterval: Duration(hours: 2)),
                            )
                          : SfDateRangePicker(
                              onSelectionChanged:
                                  (DateRangePickerSelectionChangedArgs args) {
                                if (args.value is PickerDateRange) {
                                  if (isCalender && isSeletionTime) {
                                    getIt<PlannerController>()
                                            .getValueDropDown1
                                            .value =
                                        DateFormat('dd/MM/yyyy')
                                            .format(args.value);
                                  }
                                  getIt<PlannerController>()
                                          .getValueDropDown1
                                          .value =
                                      DateFormat('dd/MM/yyyy')
                                          .format(args.value.startDate);
                                  getIt<PlannerController>()
                                          .getValueDropDown2
                                          .value =
                                      DateFormat('dd/MM/yyyy')
                                          .format(args.value.endDate);
                                }
                              },
                              selectionMode: DateRangePickerSelectionMode.range,
                              initialSelectedRange: PickerDateRange(
                                  DateTime.now(), DateTime.now()),
                            ),
                )
              ],
            ),
          ),
        ),
      );
    }),
  );
}
