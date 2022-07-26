import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_with_signup/provider/habits.dart';
import 'package:login_with_signup/provider/habits2.dart';
import 'package:login_with_signup/provider/habits3.dart';
import 'package:login_with_signup/provider/habits4.dart';
import 'package:login_with_signup/provider/habits5.dart';
import 'package:login_with_signup/provider/habits6.dart';

class Utils {
  static void showSnackBar(BuildContext context, String text) =>
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text(text)));

  static Future<DateTime?> showDateDialog(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    return picked;
  }

  static setDateText(DateTime createdTime) {
    var formattedDate =
        "${createdTime.day}-${createdTime.month}-${createdTime.year}";
    return Text(formattedDate);
  }

  static int getGraphMaxValue(
      HabitsProvider provider,
      Habits2Provider provider2,
      Habits3Provider provider3,
      Habits4Provider provider4,
      Habits5Provider provider5,
      Habits6Provider provider6) {
    int count = provider.habits.length + provider.habitsCompleted.length;

    if (count <= provider2.habit2.length + provider2.habits2Completed.length) {
      count = provider2.habit2.length + provider2.habits2Completed.length;
    }
    if (count <= provider3.habits3.length +provider3.habits3Completed.length) {
      count = provider3.habits3.length +provider3.habits3Completed.length;
    }
    if (count <= provider4.habits4.length + provider4.habits4Completed.length) {
      count = provider4.habits4.length + provider4.habits4Completed.length;
    }
    if (count <= provider5.habits5.length + provider5.habits5Completed.length) {
      count = provider5.habits5.length + provider5.habits5Completed.length;
    }
    if (count <= provider6.habits6.length + provider6.habits6Completed.length) {
      count = provider6.habits6.length + provider6.habits6Completed.length;
    }
    return count;
  }
}
