import 'package:flutter/material.dart';
import 'package:login_with_signup/models/habit3.dart';
import 'package:provider/provider.dart';

import '../provider/habits3.dart';
import 'habit3_form_widget.dart';

class Add3HabitDialogWidget extends StatefulWidget {
  const Add3HabitDialogWidget({Key? key}) : super(key: key);

  @override
  State<Add3HabitDialogWidget> createState() => _Add3HabitDialogWidgetState();
}

class _Add3HabitDialogWidgetState extends State<Add3HabitDialogWidget> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String description = '';

  DateTime createdTime = DateTime.now();

  @override
  Widget build(BuildContext context) => AlertDialog(
    content: Form(
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
          Habit3FormWidget(
            onChangedTitle: (title) => setState(() => this.title = title),
            onChangedDescription: (description) => setState(() => this.description = description),
            onSavedHabit: addHabit3, description: '', title: '',
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
  void addHabit3() {
    final isValid = _formKey.currentState!.validate();

    if (!isValid) {
      return;
    } else {
      final habit3 = Habit3(
        id: DateTime.now().toString(),
        title: title,
        description: description,
        createdTime: createdTime,
      );
      final provider = Provider.of<Habits3Provider>(context, listen: false);
      provider.addHabit3(habit3);

      Navigator.of(context).pop();
    }
  }
}

