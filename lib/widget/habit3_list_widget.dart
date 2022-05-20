import 'package:flutter/cupertino.dart';
import 'package:login_with_signup/models/habit3.dart';

import '../models/habit.dart';
import 'habit3_widget.dart';


class Habit3ListWidget extends StatelessWidget {
  const Habit3ListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Habit3Widget(
      habit: Habit3(
          createdTime: DateTime.now(),
          title: 'Walk the monkey', id: ''
      ),
    );
  }
}
