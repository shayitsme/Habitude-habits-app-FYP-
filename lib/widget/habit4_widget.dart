import 'package:flutter/material.dart';


import '../models/habit.dart';


class Habit4Widget extends StatelessWidget {
  final Habit habit;
  const Habit4Widget({
    Key? key, required this. habit}) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
    children: [
      Checkbox(
        activeColor: Colors. amber,
        checkColor: Colors.black,
        value: habit. isDone,
        onChanged: (_) {},
      )
    ],
  );
}