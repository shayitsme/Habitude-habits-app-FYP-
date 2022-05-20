import 'package:flutter/material.dart';
import 'package:login_with_signup/models/habit2.dart';


import 'habit2_widget.dart';

class Habit2ListWidget extends StatelessWidget {
  const Habit2ListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Habit2Widget(
      habit: Habit2(
          createdTime: DateTime.now(),
          title: 'Walk the cat', id: ''
      ),
    );
  }
}
