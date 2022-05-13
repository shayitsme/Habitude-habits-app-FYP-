import 'package:flutter/material.dart';

class AddHabitDialogWidget extends StatefulWidget {
  const AddHabitDialogWidget({Key? key}) : super(key: key);

  @override
  State<AddHabitDialogWidget> createState() => _AddHabitDialogWidgetState();
}

class _AddHabitDialogWidgetState extends State<AddHabitDialogWidget> {
  final _formkey = GlobalKey<FormState>();
  String title = '';
  String description = '';


  @override
  Widget build(BuildContext context) => AlertDialog(
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
