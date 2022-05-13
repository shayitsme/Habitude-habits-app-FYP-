import 'package:flutter/material.dart';

class Add4HabitDialogWidget extends StatefulWidget {
  const Add4HabitDialogWidget({Key? key}) : super(key: key);

  @override
  State<Add4HabitDialogWidget> createState() => _Add4HabitDialogWidgetState();
}

class _Add4HabitDialogWidgetState extends State<Add4HabitDialogWidget> {
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
