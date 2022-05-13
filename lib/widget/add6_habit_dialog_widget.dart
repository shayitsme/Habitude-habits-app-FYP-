import 'package:flutter/material.dart';

class Add6HabitDialogWidget extends StatefulWidget {
  const Add6HabitDialogWidget({Key? key}) : super(key: key);

  @override
  State<Add6HabitDialogWidget> createState() => _Add6HabitDialogWidgetState();
}

class _Add6HabitDialogWidgetState extends State<Add6HabitDialogWidget> {
  final _formkey = GlobalKey<FormState>();
  String title = '';
  String description = '';

  @override
  Widget build(BuildContext context)  => AlertDialog(
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Add Habit',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),

        ),
      ],
    ),
  );

}


