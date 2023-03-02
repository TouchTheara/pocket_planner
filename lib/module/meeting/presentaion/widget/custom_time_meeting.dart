import 'package:flutter/material.dart';
import 'package:pocket_planner/config/app_colors.dart';
import 'package:pocket_planner/module/meeting/data/model/meeting_model.dart';

import '../../../../widget/custom_popup_selection.dart';

Widget customTimeMeeting(BuildContext context) {
  List<String> listTime = [
    '08:00',
    '09:00',
    '10:00',
    '11:00',
    '12:00',
    '01:00',
    '02:00',
    '03:00',
    '04:00',
    '05:00',
  ];
  MeetingModel meetingModel = MeetingModel(
      meetingSubject: "Branding Work", timeIn: '10:00', timeOut: '11:30');
  return Stack(
    children: [
      SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            ...listTime
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child:
                        timeRow(context, time: e, meetingModel: meetingModel),
                  ),
                )
                .toList(),
          ],
        ),
      ),
      Positioned(
        bottom: 20,
        right: 20,
        child: InkWell(
          onTap: () {
            functionPopUpSelection(context,
                isCalender: true,
                isSeletionTime: true,
                title: "Seletion Time",
                percentHeight: 0.36);
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 2,
                      spreadRadius: 0,
                      offset: const Offset(1, 1))
                ]),
            child: const Icon(
              Icons.add,
              color: AppColors.btnColor,
            ),
          ),
        ),
      ),
    ],
  );
}

Widget timeRow(BuildContext context,
    {required String time, required MeetingModel meetingModel}) {
  return SizedBox(
    width: MediaQuery.of(context).size.width,
    height: meetingModel.timeIn!.contains(time) ? 50 : 25,
    child: Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: Row(
            children: [
              Text(
                time,
                style: const TextStyle(color: Colors.black),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Container(
                  child: Container(
                    height: 1,
                    color: Colors.grey.shade300,
                  ),
                ),
              ),
            ],
          ),
        ),
        if (meetingModel.timeIn!.contains(time))
          Padding(
            padding: const EdgeInsets.only(left: 80, right: 20),
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 5),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.grey.shade400),
                    child: Text(meetingModel.meetingSubject![0].toUpperCase()),
                  ),
                  const SizedBox(
                    width: 1,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 6, horizontal: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(meetingModel.meetingSubject.toString()),
                          Text(
                              "${meetingModel.timeIn} - ${meetingModel.timeOut}"),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
      ],
    ),
  );
}
