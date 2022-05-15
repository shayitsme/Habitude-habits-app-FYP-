


import 'package:flutter/cupertino.dart';

import '../models/habit.dart';
import 'habit5_widget.dart';
import 'habit6_widget.dart';


class Habit6ListWidget extends StatelessWidget {
  const Habit6ListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Habit6Widget(
      habit: Habit(
          createdTime: DateTime.now(),
          title: 'Walk the dog', id: ''
      ),
    );
  }
}
