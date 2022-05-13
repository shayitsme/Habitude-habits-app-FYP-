import 'package:flutter/material.dart';

import 'habit3_form_widget.dart';

class Add3HabitDialogWidget extends StatefulWidget {
  const Add3HabitDialogWidget({Key? key}) : super(key: key);

  @override
  State<Add3HabitDialogWidget> createState() => _Add3HabitDialogWidgetState();
}

class _Add3HabitDialogWidgetState extends State<Add3HabitDialogWidget> {
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
        SizedBox(height: 8),
        Habit3FormWidget(
          onChangedTitle: (title) => setState(() => this.title = title),
          onChangedDescription: (description) => setState(() => this.description = description),
          onSavedHabit: () {}, description: '', title: '',
        ),

      ],
    ),
  );

}


