import 'dart:core';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:toggel_client/data/model/time_entry_model.dart';
import "package:collection/collection.dart";

String timeDuration(Duration duration) {

  String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
  String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
  return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
}

String twoDigits(int duration) => duration.toString().padLeft(2, "0");

String formatDate(String timeString) {
  List<String> list = timeString.split("T");
  List<String> dateList = list[0].split("-");
  List<String> timeList = list[1].split(":");
  int hours = int.parse(timeList[0]);
  if (hours > 12) {
    return "${dateList[2]}-${dateList[1]}-${dateList[0]}\t&\t${hours - 12}:${timeList[1]} PM";
  } else {
    if (hours == 0) {
      return "${dateList[2]}-${dateList[1]}-\t&\t${dateList[0]}${12}:${timeList[1]} AM";
    } else {
      return "${dateList[2]}-${dateList[1]}-\t&\t${dateList[0]}$hours:${timeList[1]} AM";
    }
  }
}

Map<String, List<TimeEntryModel>> groupedByDate(timeEntryList) =>
    groupBy(timeEntryList, (obj) => obj.start.toString().substring(0, 10));

int sumTotalDuration(timeEntryList, index) {
  int duration = 0;
  groupedByDate(timeEntryList).values.elementAt(index).forEach((element) {
    if (element.duration > 0) duration += element.duration;
  });
  return duration;
}

bool validateEmail(String value) {
  RegExp regExp =
      RegExp(r"^([a-z A-Z0-9\\_\\-\\.]*)+@[a-zA-Z0-9\\_\\-]+\.[a-zA-Z]+");
  if (!regExp.hasMatch(value)) return false;
  return true;
}

void navigateAndFinish(
  context,
  widget,
) =>
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => widget,
        ));
