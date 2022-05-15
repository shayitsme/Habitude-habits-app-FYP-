


import 'package:flutter/cupertino.dart';

import '../models/habit.dart';
import 'habit5_widget.dart';

class Habit5ListWidget extends StatelessWidget {
  const Habit5ListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Habit5Widget(
      habit: Habit(
          createdTime: DateTime.now(),
          title: 'Walk the dog', id: ''
      ),
    );
  }
}
