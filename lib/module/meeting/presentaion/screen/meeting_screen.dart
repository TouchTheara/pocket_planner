import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../../config/app_colors.dart';
import 'package:intl/intl.dart';

import '../widget/custom_time_meeting.dart';

class MeetingScreen extends StatelessWidget {
  const MeetingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeHeight = MediaQuery.of(context).size.height;
    final sizeWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: AppColors.primaryColor,
            expandedHeight: sizeHeight * 0.34,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.none,
              background: Padding(
                padding: EdgeInsets.only(top: sizeHeight * 0.07),
                child: SfDateRangePicker(
                  allowViewNavigation: false,
                  view: DateRangePickerView.month,
                  monthViewSettings: const DateRangePickerMonthViewSettings(
                    dayFormat: 'EEE',
                    viewHeaderStyle: DateRangePickerViewHeaderStyle(
                      textStyle: TextStyle(fontSize: 12, letterSpacing: 0),
                    ),
                  ),
                  todayHighlightColor: Colors.white,
                  headerStyle: const DateRangePickerHeaderStyle(
                      textStyle: TextStyle(color: Colors.white),
                      textAlign: TextAlign.right),
                  selectionTextStyle: const TextStyle(color: Colors.white),
                  monthCellStyle: const DateRangePickerMonthCellStyle(
                    textStyle: TextStyle(color: Colors.white),
                  ),
                  selectionColor: AppColors.btnColor,
                  backgroundColor: AppColors.primaryColor,
                  onSelectionChanged:
                      (DateRangePickerSelectionChangedArgs args) {
                    // if (args.value is PickerDateRange) {}
                    debugPrint(
                        "------------ ${DateFormat('dd/MM/yyyy').format(args.value)}");
                  },
                  selectionMode: DateRangePickerSelectionMode.single,
                  initialSelectedRange: PickerDateRange(
                    DateTime.now(),
                    DateTime.now(),
                  ),
                ),
              ),
            ),
          ),
          SliverFillRemaining(
            // fillOverscroll: true,
            child: Container(
                height: MediaQuery.of(context).size.height * 0.62,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: const Color(0xfffef9f9),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: customTimeMeeting(context)),
          )
        ],
      ),
    );
  }
}
