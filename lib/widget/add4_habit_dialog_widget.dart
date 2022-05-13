import 'package:flutter/material.dart';

import 'habit4_form_widget.dart';

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
        SizedBox(height: 8),
        Habit4FormWidget(
          onChangedTitle: (title) => setState(() => this.title = title),
          onChangedDescription: (description) => setState(() => this.description = description),
          onSavedHabit: () {}, description: '', title: '',
        ),

      ],
    ),
  );

}
