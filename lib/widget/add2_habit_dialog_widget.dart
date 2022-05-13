import 'package:flutter/material.dart';

import 'habit2_form_widget.dart';

class Add2HabitDialogWidget extends StatefulWidget {
  const Add2HabitDialogWidget({Key? key}) : super(key: key);

  @override
  State<Add2HabitDialogWidget> createState() => _Add2HabitDialogWidgetState();
}

class _Add2HabitDialogWidgetState extends State<Add2HabitDialogWidget> {
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
        SizedBox(height: 8),
        Habit2FormWidget(
          onChangedTitle: (title) => setState(() => this.title = title),
          onChangedDescription: (description) => setState(() => this.description = description),
          onSavedHabit: () {}, description: '', title: '',
        ),

      ],
    ),
  );

}
