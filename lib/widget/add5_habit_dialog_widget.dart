import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/habit5.dart';
import '../provider/habits5.dart';
import 'habit5_form_widget.dart';

class Add5HabitDialogWidget extends StatefulWidget {
  const Add5HabitDialogWidget({Key? key}) : super(key: key);

  @override
  State<Add5HabitDialogWidget> createState() => _Add5HabitDialogWidgetState();
}

class _Add5HabitDialogWidgetState extends State<Add5HabitDialogWidget> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String description = '';
  DateTime createdTime = DateTime.now();
  @override
  Widget build(BuildContext context)  => AlertDialog(
    content:  Form(
      key: _formKey,
      child: Column(
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
            onSavedHabit: addHabit5, description: '', title: '',        onDatePicked: (v) {
            setState(() {
              createdTime = v;
            });
          },
          ),

        ],
      ),
    ),
  );

  void addHabit5() {
    final isValid = _formKey.currentState!.validate();

    if (!isValid) {
      return;
    } else {
      final habit5 = Habit5(
        id: DateTime.now().toString(),
        title: title,
        description: description,
        createdTime: createdTime,
      );
      final provider = Provider.of<Habits5Provider>(context, listen: false);
      provider.addHabit5(habit5);

      Navigator.of(context).pop();
    }
  }
}





