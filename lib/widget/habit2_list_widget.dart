import 'package:flutter/material.dart';

import '../models/habit.dart';
import 'habit2_widget.dart';

class Habit2ListWidget extends StatelessWidget {
  const Habit2ListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Habit2Widget(
      habit: Habit(
          createdTime: DateTime.now(),
          title: 'Walk the dog', id: ''
      ),
    );
  }
}
