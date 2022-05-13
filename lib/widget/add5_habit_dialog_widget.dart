import 'package:flutter/material.dart';

import 'habit5_form_widget.dart';

class Add5HabitDialogWidget extends StatefulWidget {
  const Add5HabitDialogWidget({Key? key}) : super(key: key);

  @override
  State<Add5HabitDialogWidget> createState() => _Add5HabitDialogWidgetState();
}

class _Add5HabitDialogWidgetState extends State<Add5HabitDialogWidget> {
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
        Habit5FormWidget(
          onChangedTitle: (title) => setState(() => this.title = title),
          onChangedDescription: (description) => setState(() => this.description = description),
          onSavedHabit: () {}, description: '', title: '',
        ),

      ],
    ),
  );

}

