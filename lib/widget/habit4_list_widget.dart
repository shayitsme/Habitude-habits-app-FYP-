import 'package:flutter/cupertino.dart';
import 'package:login_with_signup/models/habit4.dart';

import '../models/habit.dart';

import 'habit4_widget.dart';

class Habit4ListWidget extends StatelessWidget {
  const Habit4ListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Habit4Widget(
      habit: Habit4(
          createdTime: DateTime.now(),
          title: 'Walk the lion', id: ''
      ),
    );
  }
}
