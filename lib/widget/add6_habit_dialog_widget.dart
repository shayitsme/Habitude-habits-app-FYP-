import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/habit6.dart';
import '../provider/habits6.dart';
import 'habit6_form_widget.dart';

class Add6HabitDialogWidget extends StatefulWidget {
  const Add6HabitDialogWidget({Key? key}) : super(key: key);

  @override
  State<Add6HabitDialogWidget> createState() => _Add6HabitDialogWidgetState();
}

class _Add6HabitDialogWidgetState extends State<Add6HabitDialogWidget> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String description = '';
  DateTime createdTime = DateTime.now();
  @override
  Widget build(BuildContext context) =>
      AlertDialog(
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
              Habit6FormWidget(
                onChangedTitle: (title) => setState(() => this.title = title),
                onChangedDescription: (description) =>
                    setState(() => this.description = description),
                onSavedHabit: addHabit6,
                description: '',
                title: '',
                onDatePicked: (v) {
                  setState(() {
                    createdTime = v;
                  });
                },
              ),

            ],
          ),
        ),
      );

  void addHabit6() {
    final isValid = _formKey.currentState!.validate();

    if (!isValid) {
      return;
    } else {
      final habit6 = Habit6(
        id: DateTime.now().toString(),
        title: title,
        description: description,
        createdTime: createdTime,
      );
      final provider = Provider.of<Habits6Provider>(context, listen: false);
      provider.addHabit6(habit6);

      Navigator.of(context).pop();
    }
  }
}

