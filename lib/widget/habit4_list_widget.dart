import 'package:flutter/cupertino.dart';

import '../models/habit.dart';

import 'habit4_widget.dart';

class Habit4ListWidget extends StatelessWidget {
  const Habit4ListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Habit4Widget(
      habit: Habit(
          createdTime: DateTime.now(),
          title: 'Walk the dog', id: ''
      ),
    );
  }
}
