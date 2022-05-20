


import 'package:flutter/cupertino.dart';
import 'package:login_with_signup/models/habit5.dart';

import '../models/habit.dart';
import 'habit5_widget.dart';

class Habit5ListWidget extends StatelessWidget {
  const Habit5ListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Habit5Widget(
      habit: Habit5(
          createdTime: DateTime.now(),
          title: 'Walk the cow', id: ''
      ),
    );
  }
}
